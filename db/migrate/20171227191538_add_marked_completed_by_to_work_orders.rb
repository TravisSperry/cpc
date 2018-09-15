class AddMarkedCompletedByToWorkOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :work_orders, :marked_completed_by, :integer
  end
end
