class CreateQualityAssuranceApprovals < ActiveRecord::Migration[5.1]
  def change
    create_table :quality_assurance_approvals do |t|
      t.integer :work_order_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
