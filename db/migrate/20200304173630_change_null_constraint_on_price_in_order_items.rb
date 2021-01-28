class ChangeNullConstraintOnPriceInOrderItems < ActiveRecord::Migration[5.2]
  def change
    change_column :order_items, :price, :decimal, :null => true
  end
end
