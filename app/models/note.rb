# frozen_string_literal: true

class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true
  belongs_to :user
  paginates_per 4
end
