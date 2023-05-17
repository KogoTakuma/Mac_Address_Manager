class AddForeignKey < ActiveRecord::Migration[5.2]
  def change
    change_column :electronics, :user_id, :string
    add_foreign_key :electronics, :users, column: :user_id, primary_key: :user_name
  end
end
