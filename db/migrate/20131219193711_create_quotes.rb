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
      t.string :part_number
      t.string :part_description
      t.string :powder_color
      t.string :powder_product_code
      t.string :powder_product_manufacturer
      t.string :part_size
      t.string :substrate
      t.string :coating_requirements
      t.boolean :paint_specs
      t.string :masking_requirements
      t.string :packaging_requirements
      t.string :quantity_year
      t.string :quantity_run
      t.text :note

      t.timestamps
    end
  end
end
