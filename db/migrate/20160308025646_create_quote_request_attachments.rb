# frozen_string_literal: true

class CreateQuoteRequestAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :quote_request_attachments do |t|
      t.integer :quote_request_id
      t.string :attachment

      t.timestamps
    end
  end
end
