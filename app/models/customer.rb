# frozen_string_literal: true

class Customer < ApplicationRecord
  mount_uploaders :attachments, AttachmentUploader

  has_many :work_orders
  has_many :contacts
  has_many :notes, as: :notable
  has_one :primary_contact, primary_key: 'primary_contact_id',
                            foreign_key: 'id',
                            class_name: 'Contact'

  enum account_type: [ :company, :individual ]

  def has_valid_address?
    address1.present? &&
      city.present? &&
      state.present? &&
      zip_code.present?
  end
end
