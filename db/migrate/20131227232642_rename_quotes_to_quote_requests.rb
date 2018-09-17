# frozen_string_literal: true

class RenameQuotesToQuoteRequests < ActiveRecord::Migration[5.0]
  def change
    rename_table :quotes, :quote_requests
  end
end
