# frozen_string_literal: true

class WorkOrderAttachment < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  belongs_to :work_order
end
