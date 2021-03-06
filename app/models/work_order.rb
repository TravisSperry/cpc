# frozen_string_literal: true

class WorkOrder < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user if controller.try :current_user }

  mount_uploaders :attachments, AttachmentUploader

  belongs_to :customer, required: true
  belongs_to :contact
  belongs_to :production_stage
  belongs_to :quote_request
  has_and_belongs_to_many :services
  has_many :quality_assurance_approvals
  has_many :line_items, inverse_of: :work_order, dependent: :destroy
  has_many :notes, as: :notable
  has_one :work_order_schedule

  # TODO: Validates presence of - customer, contact, name

  enum status: %i[received scheduled in_progress ready_for_invoice complete].freeze

  accepts_nested_attributes_for :line_items,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['description'].blank? }

  after_create :set_status_to_received

  def completed_by
    User.find(marked_completed_by) if marked_completed_by
  rescue ActiveRecord::RecordNotFound => error
    OpenStruct.new(full_name: 'Deleted User')
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
    received!
  end
end
