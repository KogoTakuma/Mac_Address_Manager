class User < ApplicationRecord
    self.primary_key = :user_name
    has_many :electronics, foreign_key: :owner_name

    validates :user_name, presence: true

    #この関数ではcsv_attributesという配列変数を定義
  def self.csv_attributes
    ["belongs", "user_name", "is_payment", "pre_payment", "is_special"]
  end

#CSV形式でインスタンスの中身を出力できるようにする
  def self.generate_csv
    #ここでcsv形式の配列csvを定義する、csv形式の配列に代入していくと列ベクトルができる？
    CSV.generate(headers: true) do |csv|
      #まずこのcsvに上記で定義したcsv_attributesを1行目として代入
      csv << csv_attributes
      all.each do |user| #userを一つ一つ取り出して
        #csvの次に行にuserの値を代入していく
        csv << csv_attributes.map{ |attr| user.send(attr) }
      end
    end
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row| #受け取ったCSVファイルを行ごとに取り出す、その時1行目headerには項目が書いてあるので、1行目は無視する
      user = new #Task.newと同価
      user.attributes = row.to_hash.slice(*csv_attributes) #userの属性に順番にデータを格納していく。詳しくは調べてください
      begin
        user.save
      rescue ActiveRecord::RecordNotUnique => e
        puts "duplicated"
        puts user.inspect
      end
    end
  end
end
