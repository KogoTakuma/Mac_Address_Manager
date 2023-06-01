class User < ApplicationRecord
    self.primary_key = :user_name
    has_many :electronics

    validates :user_name, presence: true

    #この関数ではcsv_attributesという配列変数を定義
  def self.csv_attributes
    ["belongs", "user_name", "is_special", "is_payment", "pre_payment", "created_at", "updated_at"]
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
end
