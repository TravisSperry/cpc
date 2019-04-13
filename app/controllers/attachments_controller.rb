class AttachmentsController < ApplicationController
  before_action :set_resource

  def create
    add_more_attachments(attachments_params[:attachments])
    if @resource.save
      flash[:notice] = 'Attachments uploaded successfully'
    else
      flash[:error] = 'Failed to upload attachments'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def set_resource
    if params.key?(:work_order)
      @resource = WorkOrder.find(params[:work_order_id])
    elsif params.key?(:customer)
      @resource = Customer.find(params[:customer_id])
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def add_more_attachments(new_attachments)
    attachments = @resource.attachments # copy the old attachments
    attachments += new_attachments # concat old attachments with new ones
    @resource.attachments = attachments # assign back
  end

  def attachments_params
    if params.key?(:work_order)
      params.require(:work_order).permit(attachments: [])
    elsif params.key?(:customer)
      params.require(:customer).permit(attachments: [])
    end
  end
end
