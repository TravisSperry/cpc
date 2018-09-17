# frozen_string_literal: true

class AddSourceToQuoteRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :quote_requests, :source, :string
  end
end
