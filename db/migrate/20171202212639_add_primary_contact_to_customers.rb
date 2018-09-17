class AddPrimaryContactToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :primary_contact_id, :integer
    add_index :customers, :primary_contact_id
  end
end
