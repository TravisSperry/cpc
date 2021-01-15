# frozen_string_literal: true

class QuoteRequest < ApplicationRecord
  has_many :quote_request_attachments
  accepts_nested_attributes_for :quote_request_attachments
  has_many :notes, as: :notable
  has_one :work_order

  belongs_to :user
  belongs_to :customer

  SOURCES = ['Word Of Mouth', 'Online Search', 'Social Media'].freeze
  STATUSES = %w[New Viewed Submitted Won Lost].freeze
end
