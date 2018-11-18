class CreateServiceSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :service_schedules do |t|
      t.references :work_order_schedule, foreign_key: true
      t.references :service, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :note

      t.timestamps
    end
  end
end
