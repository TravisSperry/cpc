# frozen_string_literal: true

class Customer < ActiveRecord::Base
  has_many :work_orders
  has_many :contacts
  has_one :primary_contact, primary_key: 'primary_contact_id',
                            class_name: 'Contact'

  enum account_type: [ :company, :individual ]
end
