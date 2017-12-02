class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.datetime :date_scheduled
      t.datetime :date_due
      t.datetime :date_completed
      t.datetime :date_in
      t.datetime :date_out
      t.integer :customer_id
      t.string :name
    end
  end
end
