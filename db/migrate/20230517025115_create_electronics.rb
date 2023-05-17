class CreateElectronics < ActiveRecord::Migration[5.2]
  def change
    create_table :electronics do |t|
      t.string :name, null: false
      t.string :mac_address, null: false
      t.boolean :is_wireless, null: false
      t.references :user, null: false, foreign_key: true
      t.string :electronics_uuid, unique: true, null: false

      t.timestamps
    end
  end
end

