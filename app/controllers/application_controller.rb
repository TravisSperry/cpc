class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_paper_trail_whodunnit

  def user_for_paper_trail
    logged_in? ? current_user.id : 'Public user'  # or whatever
  end
end
