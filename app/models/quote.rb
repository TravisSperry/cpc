# frozen_string_literal: true

class Quote < ActiveRecord::Base
  belongs_to :user
end
