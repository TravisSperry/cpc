class CreateTrackingEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :tracking_entries do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :deleted_at
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
