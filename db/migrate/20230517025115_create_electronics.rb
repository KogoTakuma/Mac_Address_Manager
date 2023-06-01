class CreateElectronics < ActiveRecord::Migration[5.2]
  def change
    create_table :electronics do |t|
      t.string :electronics_name, null: false
      t.string :mac_address, null: false
      t.boolean :is_wireless, null: false

      t.string :owner_name, null: false
      t.foreign_key :users, column: :owner_name, primary_key: :user_name
      t.index :owner_name
      t.timestamps
    end
  end
end

