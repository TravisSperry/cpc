class QuoteRequest < ActiveRecord::Base
  # include PublicActivity::Model
  # tracked owner: Proc.new{ |controller, model| controller.current_user }
   has_many :quote_request_attachments
   accepts_nested_attributes_for :quote_request_attachments

  belongs_to :user
end
