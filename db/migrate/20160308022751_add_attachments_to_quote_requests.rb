# frozen_string_literal: true

class AddAttachmentsToQuoteRequests < ActiveRecord::Migration
  def change
    add_column :quote_requests, :attachments, :json
  end
end
