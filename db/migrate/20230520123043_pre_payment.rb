class PrePayment < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pre_payment, :boolean, default: false
  end
end
