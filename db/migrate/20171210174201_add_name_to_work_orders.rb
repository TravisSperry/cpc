class AddNameToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :name, :string
  end
end
