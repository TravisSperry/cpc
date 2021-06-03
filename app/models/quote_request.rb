# frozen_string_literal: true

require 'csv'

class QuoteRequest < ApplicationRecord
  has_many :quote_request_attachments
  accepts_nested_attributes_for :quote_request_attachments
  has_many :notes, as: :notable
  has_one :work_order
  has_many :quotes

  belongs_to :user
  belongs_to :customer

  SOURCES = ['Word Of Mouth', 'Online Search', 'Social Media'].freeze
  STATUSES = %w[New Viewed Submitted Won Lost].freeze

  def self.to_csv
    CSV.generate do |csv|
      csv << ['created at', 'first name', 'last name', 'phone', 'email', 'job title', 'customer id', 'customer name', 'employee email', 'employee id', 'status', 'source']
      all.each do |quote_request|
        csv << [quote_request.created_at&.iso8601, quote_request.first_name, quote_request.last_name, quote_request.telephone, quote_request.email, quote_request.job_title, quote_request.customer_id, quote_request.customer&.name, quote_request.user&.email, quote_request.user_id, quote_request.status, quote_request.source]
      end
    end
  end
end
