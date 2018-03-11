# frozen_string_literal: true

class WorkOrder < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user } if controller.try :current_user

  belongs_to :customer
  belongs_to :contact
  has_and_belongs_to_many :services
  has_many :line_items, inverse_of: :work_order, dependent: :destroy
  has_many :notes, as: :notable



  # TODO: Validates presence of - customer, contact, name

  enum status: [:received, :scheduled, :in_progress, :ready_for_invoice, :complete].freeze

  accepts_nested_attributes_for :line_items,
    allow_destroy: true,
    reject_if: proc { |attributes| attributes['description'].blank? }

  after_create :set_status_to_received

  def completed_by
    User.find(marked_completed_by) if marked_completed_by
  end

  private

  def set_status_to_received
    self.received!
  end
end
