class AddNameToWorkOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :work_orders, :name, :string
  end
end
