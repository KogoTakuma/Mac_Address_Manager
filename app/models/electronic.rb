class Electronic < ApplicationRecord
    belongs_to :electronic, foreign_key: true
    #primary_key: :electronic_name
    #validates :id, presence: true

    def self.csv_attributes
        ["user_id","electronics_name", "mac_address", "is_wireless"]
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
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row| #受け取ったCSVファイルを行ごとに取り出す、その時1行目headerには項目が書いてあるので、1行目は無視する
          user = User.find(row.to_hash.slice("user_id")["user_id"])
          electronic = user.electronics.new
          electronic.attributes = row.to_hash.slice(*csv_attributes) #electronicの属性に順番にデータを格納していく。詳しくは調べてください
          electronic.user_id = user.user_name
          electronic.id = rand(99999999)
          puts electronic.inspect
          electronic.save!
        end
      end

end
