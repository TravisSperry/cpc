class StaticPagesController < ApplicationController
  protect_from_forgery

  def home
    @new_quote_requests = QuoteRequest.where('status=?', 'New')
  end

  def about
  end

  def thank_you
  end
end
