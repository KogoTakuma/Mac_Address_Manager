class ElectronicsController < ApplicationController
  def index
    @electronics = Electronic.all
    send_data @electronics.generate_csv, filename: "electronics-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"
        #format.csvの場合は、つまり/electronic.csvになっている場合はという意味。その場合は後述の処理をする。ここではsend dataをしているので、データをブラウザからダウンロードされるようにしている
  end

  def import 
    CSV.foreach(params[:file].path, headers: true) do |row| #受け取ったCSVファイルを行ごとに取り出す、その時1行目headerには項目が書いてあるので、1行目は無視する
      user = User.find(row.to_hash.slice("owner_name")["owner_name"])
      electronic = user.electronics.new
      electronic.attributes = row.to_hash.slice(*["electronics_name", "mac_address", "is_wireless"])

      begin
        electronic.save
      rescue ActiveRecord::RecordNotUnique => e
        puts "duplicated"
        puts electronic.inspect
      end
    end
    redirect_to rails_admin_path, notice: "タスクを追加しました"
  end

  def pre_import 
  end
end
