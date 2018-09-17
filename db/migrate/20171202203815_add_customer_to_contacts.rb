class AddCustomerToContacts < ActiveRecord::Migration[5.0]
  def change
    add_reference :contacts, :customer, index: true, foreign_key: true
  end
end
