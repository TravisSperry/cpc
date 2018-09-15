class CreateServicesWorkOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :services_work_orders do |t|
      t.belongs_to :service
      t.belongs_to :work_order
    end
  end
end
