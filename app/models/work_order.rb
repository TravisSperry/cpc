# frozen_string_literal: true

class WorkOrder < ActiveRecord::Base
  include PublicActivity::Model
  tracked
  
  belongs_to :customer
  belongs_to :contact
  has_and_belongs_to_many :services
  has_many :line_items, dependent: :destroy
  has_many :notes, as: :notable



  # TODO: Validates presence of - customer, contact, name

  enum status: [:received, :in_progress, :ready_for_invoice, :complete].freeze

  accepts_nested_attributes_for :line_items,
    allow_destroy: true,
    reject_if: proc { |attributes| attributes['description'].blank? }

  after_create :set_status_to_in_progress

  def completed_by
    User.find(marked_completed_by) if marked_completed_by
  end

  private

  def set_status_to_in_progress
    self.received!
  end
end
