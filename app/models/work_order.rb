# frozen_string_literal: true

class WorkOrder < ActiveRecord::Base
  belongs_to :customer
  belongs_to :contact
end
