class CreateWorkOrderAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :work_order_attachments do |t|
      t.string :attachment
      t.belongs_to :work_order, foreign_key: true

      t.timestamps
    end
  end
end
