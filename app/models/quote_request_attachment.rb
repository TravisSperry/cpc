class QuoteRequestAttachment < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  belongs_to :quote_request
end
