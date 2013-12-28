class QuoteRequest < ActiveRecord::Base
  include PublicActivity::Common

  attr_accessible :address_1, :address_2, :city, :coating_requirements, :company_name, :email, :fax, :first_name,
                  :job_title, :last_name, :masking_requirements, :note, :packaging_requirements, :paint_specs,
                  :part_description, :part_number, :part_size, :powder_color, :powder_product_code, :powder_product_manufacturer,
                  :quantity_run, :quantity_year, :state, :substrate, :telephone, :zip, :status, :user_id

  belongs_to :user

  before_update :create_update_activity

    private
      def create_update_activity

        #record activity of update action including new and old status
        self.create_activity :update, owner: current_user, parameters: { new_user_id: self.user_id, old_user_id: self.user_id_was, new_status: self.status, old_status: self.status_was }
      end
end
