# frozen_string_literal: true

class AddSourceToQuoteRequests < ActiveRecord::Migration
  def change
    add_column :quote_requests, :source, :string
  end
end
