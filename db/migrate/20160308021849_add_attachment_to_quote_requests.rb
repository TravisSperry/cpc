class AddAttachmentToQuoteRequests < ActiveRecord::Migration
  def change
    add_column :quote_requests, :attachment, :string
  end
end
