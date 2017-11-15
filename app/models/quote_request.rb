# frozen_string_literal: true

class QuoteRequest < ActiveRecord::Base
  has_many :quote_request_attachments
  accepts_nested_attributes_for :quote_request_attachments
  has_many :notes, as: :notable

  belongs_to :user

  SOURCES = ['Word Of Mouth', 'Online Search', 'Social Media'].freeze
end
