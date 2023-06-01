class CommandController < ApplicationController
  def generate
    @output = generate_command()
  end



  private
  def generate_command()
    valid_users = User.where("is_payment IN (?) OR is_special IN (?) OR pre_payment IN (?)", true, true, true)
    valid_users_mac_address = Electronic.where(owner_name: valid_users.pluck(:user_name))
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
