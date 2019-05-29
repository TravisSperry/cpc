module Customers
  class WorkOrdersController < ApplicationController
    load_and_authorize_resource :work_order
    load_and_authorize_resource through: :customer

    before_action :set_user_feature_flash

    def show; end

    private

    def set_user_feature_flash
      flash[:alert] = 'This feature is not yet available. If you create a resource '\
                        'it will be deleted.'
    end
  end
end
