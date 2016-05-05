class CreateQuoteRequestAttachments < ActiveRecord::Migration
  def change
    create_table :quote_request_attachments do |t|
      t.integer :quote_request_id
      t.string :attachment

      t.timestamps
    end
  end
end
