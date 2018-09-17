class AttachmentsController < ApplicationController
  before_action :set_work_order

  def create
    add_more_attachments(attachments_params[:attachments])
    flash[:error] = "Failed uploading images" unless @work_order.save
    redirect_back(fallback_location: root_path)
  end

  private

  def set_work_order
    @work_order = WorkOrder.find(params[:work_order_id])
  end

  def add_more_attachments(new_attachments)
    attachments = @work_order.attachments  # copy the old attachments
    attachments += new_attachments # concat old attachments with new ones
    @work_order.attachments = attachments # assign back
  end

  def attachments_params
    params.require(:work_order).permit({attachments: []})
  end
end
