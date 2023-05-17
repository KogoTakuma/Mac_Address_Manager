class CreateElectronics < ActiveRecord::Migration[5.2]
  def change
    create_table :electronics do |t|
      t.string :electronics_name, null: false
      t.string :mac_address, null: false
      t.boolean :is_wireless, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

