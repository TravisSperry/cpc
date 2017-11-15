# frozen_string_literal: true

class Color < ActiveRecord::Base
  has_many :powders
end
