class AddPrimaryContactIdToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :primary_contact_id, :integer
  end
end
