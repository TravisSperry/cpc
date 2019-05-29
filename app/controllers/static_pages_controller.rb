# frozen_string_literal: true

class StaticPagesController < ApplicationController
  protect_from_forgery

  def home; end

  def about; end

  def thank_you; end
end
