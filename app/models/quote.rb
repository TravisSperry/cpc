class Quote < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :city, :coating_requirements, :company_name, :email, :fax, :first_name, :job_title, :last_name, :masking_requirements, :note, :packaging_requirements, :paint_specs, :part_description, :part_number, :part_size, :powder_color, :powder_product_code, :powder_product_manufacturer, :quantity_run, :quantity_year, :state, :substrate, :telephone, :zip
end
