class CreateWorkOrderSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :work_order_schedules do |t|
      t.references :work_order, foreign_key: true

      t.timestamps
    end
  end
end
