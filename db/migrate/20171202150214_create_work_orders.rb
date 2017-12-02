class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.date_time :date_scheduled
      t.date_time :date_due
      t.date_time :date_completed
      t.date_time :date_picked_up
      t.integer :customer_id
      t.string :name
    end
  end
end
