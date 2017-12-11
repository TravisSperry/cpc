# frozen_string_literal: true

class WorkOrder < ActiveRecord::Base
  belongs_to :customer
  belongs_to :contact
  has_and_belongs_to_many :services
  has_many :line_items, dependent: :destroy

  # TODO: Validates presence of - customer, contact, name

  accepts_nested_attributes_for :line_items,
    allow_destroy: true,
    reject_if: proc { |attributes| attributes['description'].blank? }
end
