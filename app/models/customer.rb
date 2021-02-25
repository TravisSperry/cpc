# frozen_string_literal: true

class Customer < ApplicationRecord
  mount_uploaders :attachments, AttachmentUploader

  has_many :work_orders
  has_many :contacts
  has_many :notes, as: :notable
  has_many :quote_requests
  has_one :primary_contact, primary_key: 'primary_contact_id',
                            foreign_key: 'id',
                            class_name: 'Contact'
  has_many :customers_users
  has_many :users, through: :customers_users

  enum account_type: %i[company individual]

  def has_valid_address?
    address1.present? &&
      city.present? &&
      state.present? &&
      zip_code.present?
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << ['name', 'phone', 'fax', 'address1', 'address2', 'city', 'state', 'zip_code', 'primary contact first name', 'email', 'account_type']
      all.each do |customer|
        csv << [customer.name, customer.phone, customer.fax, customer.address1, customer.address2, customer.city, customer.state, customer.zip_code, customer.primary_contact&.first_name, customer.email, customer.account_type]
      end
    end
  end
end
