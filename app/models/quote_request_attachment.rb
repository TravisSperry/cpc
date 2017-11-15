# frozen_string_literal: true

class QuoteRequestAttachment < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  belongs_to :quote_request
end
