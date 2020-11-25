class ServiceTrackingController < ApplicationController
  before_action :set_service_tracking

  # GET /service_trackings
  def index
    @tracking_entries = @service_tracking.tracking_entries || []
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service_tracking
    @service_tracking = ServiceTracking.where(work_order: work_order).first_or_create
  end

  def work_order
    WorkOrder.find(work_order_id)
  end

  def work_order_id
    service_tracking_params[:work_order_id]
  end

  # Only allow a trusted parameter "white list" through.
  def service_tracking_params
    params.permit(:work_order_id, :tracking_entries_id)
  end
end
