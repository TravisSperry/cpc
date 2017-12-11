# frozen_string_literal: true

class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :company_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :telephone
      t.string :fax
      t.text :note

      t.timestamps
    end
  end
end
