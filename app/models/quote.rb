# frozen_string_literal: true

class Quote < ApplicationRecord
  belongs_to :quote_request
  belongs_to :user
end
