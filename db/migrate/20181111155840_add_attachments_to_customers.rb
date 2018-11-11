class AddAttachmentsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :attachments, :string, array: true, default: []
  end
end
