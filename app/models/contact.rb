# frozen_string_literal: true

class Contact < ActiveRecord::Base
  belongs_to :company
end
