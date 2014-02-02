class StaticPagesController < ApplicationController
  protect_from_forgery

  def home
    @new_quote_requests = QuoteRequest.where('status=?', 'New')
    @activities = PublicActivity::Activity.where("created_at > ?", 20.day.ago).order("created_at DESC").limit(10)
  end

  def about
  end
end