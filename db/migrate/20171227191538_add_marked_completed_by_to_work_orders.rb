class AddMarkedCompletedByToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :marked_completed_by, :integer
  end
end
