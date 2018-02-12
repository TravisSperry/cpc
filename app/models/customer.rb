# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :work_orders
  has_many :contacts
  has_one :primary_contact, primary_key: 'primary_contact_id',
                            foreign_key: 'id',
                            class_name: 'Contact'

  enum account_type: [ :company, :individual ]
end
