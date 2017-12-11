class AddPrimaryContactToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :primary_contact_id, :integer
    add_index :customers, :primary_contact_id
  end
end
