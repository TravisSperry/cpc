# frozen_string_literal: true

class Customer < ActiveRecord::Base
  has_many :work_orders
  has_many :contacts
  has_one :primary_contact, class_name: 'Contact',
                            foreign_key: 'primary_contact_id' 
end
