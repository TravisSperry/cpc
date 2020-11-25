class CreateServiceTrackings < ActiveRecord::Migration[5.2]
  def change
    create_table :service_trackings do |t|
      t.references :work_order, foreign_key: true
      t.references :tracking_entries, foreign_key: true

      t.timestamps
    end
  end
end
