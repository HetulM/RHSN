class ChangeNullConstraintOnLastNameInOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :last_name, :string, :null => true
  end
end
