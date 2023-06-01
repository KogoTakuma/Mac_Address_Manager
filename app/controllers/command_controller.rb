class CommandController < ApplicationController
  def generate
    @output = generate_command()
  end

  def output_user
    respond_to do |format| #この意味はURLのformatによって、新たに変更を加えるよという意味
      format.html #format.htmlの場合は、つまりURLが/usersの時はという意味。format.htmlの後に処理が書かれていないため何もせず画面遷移する
      format.csv { send_data @users.generate_csv, filename: "users-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    #format.csvの場合は、つまり/user.csvになっている場合はという意味。その場合は後述の処理をする。ここではsend dataをしているので、データをブラウザからダウンロードされるようにしている
    end
  end




  private
  def generate_command()
    valid_users = User.where("is_payment IN (?) OR is_special IN (?) OR pre_payment IN (?)", true, true, true)
    valid_users_mac_address = Electronic.where(user_id: valid_users.pluck(:user_name))
    result = valid_users_mac_address.pluck(:mac_address).map(&:to_s)
    count = 0
    output_str  = ""
    result.each do |mac_addres|
      count = count + 1
      line = "ethernet filter " + count.to_s + " pass-nolog " + mac_addres.gsub("-", ":") + "<br>"
      output_str = output_str + line
    end
    output_str = output_str + "ethernet lan1 filter in "
    (1..count).each do |num|
      output_str = output_str + num.to_s + " "
    end
    output_str = output_str +"<br>"+"dhcp service server<br>dhcp server rfc2131 compliant except remain-silent<br>dhcp scope 1 192.168.100.2-192.168.100.230/24"
  end
end
