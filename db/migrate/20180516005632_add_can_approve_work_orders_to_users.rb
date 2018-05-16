class AddCanApproveWorkOrdersToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :can_approve_work_orders, :boolean, default: false
  end
end
