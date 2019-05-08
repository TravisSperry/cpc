module Customers
  class DashboardsController < ApplicationController
    def show
      @customer = current_user.customers.includes(work_orders: [:services, line_items: [:services]]).first
    end
  end
end
