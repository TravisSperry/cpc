# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  include PublicActivity::StoreController

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_paper_trail_whodunnit

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def user_for_paper_trail
    signed_in? ? current_user.id : 'Public user' # or whatever
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end
end
