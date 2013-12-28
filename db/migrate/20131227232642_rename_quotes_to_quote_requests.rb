class RenameQuotesToQuoteRequests < ActiveRecord::Migration
  def change
    rename_table :quotes, :quote_requests
  end
end
