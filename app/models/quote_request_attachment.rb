# frozen_string_literal: true

class QuoteRequestAttachment < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  belongs_to :quote_request
end
