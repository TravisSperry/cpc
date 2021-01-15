class AddCustomerToQuoteRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :quote_requests, :customer, foreign_key: true
  end
end
