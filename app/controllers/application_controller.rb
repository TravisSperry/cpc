# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  include PublicActivity::StoreController 

  before_action :set_paper_trail_whodunnit

  def user_for_paper_trail
    signed_in? ? current_user.id : 'Public user' # or whatever
  end
end
