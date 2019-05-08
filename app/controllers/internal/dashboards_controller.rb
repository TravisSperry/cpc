module Internal
  class DashboardsController < ApplicationController
    def show
        @new_quote_requests = QuoteRequest.where('status=?', 'New')
        @outstanding_work_orders = WorkOrder.includes(:customer, :services)
                                            .left_outer_joins(:production_stage, :services)
                                            .where('date_completed IS NULL')

        @work_orders = @outstanding_work_orders
    end
  end
end
