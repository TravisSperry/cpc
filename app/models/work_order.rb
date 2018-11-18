# frozen_string_literal: true

class WorkOrder < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user if controller.try :current_user }

  mount_uploaders :attachments, AttachmentUploader

  belongs_to :customer
  belongs_to :contact
  belongs_to :production_stage
  has_and_belongs_to_many :services
  has_many :quality_assurance_approvals
  has_many :line_items, inverse_of: :work_order, dependent: :destroy
  has_many :notes, as: :notable
  has_one :work_order_schedule

  # TODO: Validates presence of - customer, contact, name

  enum status: [:received, :scheduled, :in_progress, :ready_for_invoice, :complete].freeze

  accepts_nested_attributes_for :line_items,
    allow_destroy: true,
    reject_if: proc { |attributes| attributes['description'].blank? }

  after_create :set_status_to_received

  def completed_by
    User.find(marked_completed_by) if marked_completed_by
  end

  def quality_assurance_approval?
    quality_assurance_approvals.pluck(:user_id).uniq.count > 1
  end

  def has_been_approved_by?(user)
    quality_assurance_approvals.pluck(:user_id).include?(user.id)
  end

  def self.received_and_scheduled
    where('status = ? OR status = ?', WorkOrder.statuses['received'], WorkOrder.statuses['scheduled'])
  end

  private

  def set_status_to_received
    self.received!
  end
end
