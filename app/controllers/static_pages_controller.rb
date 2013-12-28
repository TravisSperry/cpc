class StaticPagesController < ApplicationController
  protect_from_forgery

  def home
    @new_quote_requests = QuoteRequest.where('status=?', 'New')
    @activities = PublicActivity::Activity.all
  end

  def about
  end
end