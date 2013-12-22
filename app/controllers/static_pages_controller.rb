class StaticPagesController < ApplicationController
  protect_from_forgery

  def home
    @new_quotes = Quote.where('status=?', 'New')
  end

  def about
  end
end