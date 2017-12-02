# frozen_string_literal: true

class Customer < ActiveRecord::Base
  has_many :work_orders
  has_many :contacts
  has_one :primary_contact, primary_key: 'contact_id',
                            class_name: 'Contact'
end
