class Electronic < ApplicationRecord
    belongs_to :user, primary_key: :user_name, foreign_key: :owner_name
    #primary_key: :electronic_name
    #validates :id, presence: true

    def self.csv_attributes
        ["owner_name","electronics_name", "mac_address", "is_wireless"]
    end
    def self.csv_attributes2
        ["electronics_name", "mac_address", "is_wireless"]
    end
    
    #CSV形式でインスタンスの中身を出力できるようにする
    def self.generate_csv
        #ここでcsv形式の配列csvを定義する、csv形式の配列に代入していくと列ベクトルができる？
        CSV.generate(headers: true) do |csv|
          #まずこのcsvに上記で定義したcsv_attributesを1行目として代入
          csv << csv_attributes
          all.each do |electronic| #electronicを一つ一つ取り出して
            #csvの次に行にelectronicの値を代入していく
            csv << csv_attributes.map{ |attr| electronic.send(attr) }
          end
        end
    end


end
