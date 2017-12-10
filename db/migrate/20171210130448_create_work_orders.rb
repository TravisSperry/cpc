class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.datetime :date_scheduled
      t.datetime :date_due
      t.datetime :date_completed
      t.references :customer, index: true, foreign_key: true
      t.references :contact, index: true, foreign_key: true
      t.text :packaging_details
    end
  end
end
