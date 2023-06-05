class AddUnique < ActiveRecord::Migration[5.2]
  def change
    add_index :electronics, :mac_address, unique: true
  end
end
