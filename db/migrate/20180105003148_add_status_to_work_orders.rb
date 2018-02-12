class AddStatusToWorkOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :work_orders, :status, :integer
  end
end
