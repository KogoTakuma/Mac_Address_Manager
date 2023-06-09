class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false  do |t|
      t.string :user_name, null: false, unique: true, primary_key: true
      t.string :belongs, null: false
      t.boolean :is_special, null: false
      t.boolean :is_payment, null: false

      t.timestamps
    end
  end
end
