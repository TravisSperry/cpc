class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :fax
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
    end
  end
end
