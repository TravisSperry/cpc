class WorkOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :assert_company!, only: [:new]
  before_action :set_work_order, only: [
                                          :show, :edit, :update, :destroy, :mark_completed,
                                          :quality_assurance_approval
                                        ]
  before_action :set_customer, only: [:new, :edit]
  before_action :can_approve?, only: [:quality_assurance_approval]

  # GET /work_orders
  def index
    @work_orders = WorkOrder.all
  end

  # GET /work_orders/1
  def show
    @notes = @work_order.notes.page(params[:page])
    @note = @notes.build
    @work_order_statuses = work_order_statuses

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "work_order_#{@work_order.id}",
               disposition: :inline,
               template: 'work_orders/show.pdf.erb'
      end
    end
  end

  # GET /work_orders/new
  def new
    unless @customer
      redirect_to customers_path, notice: 'Please select or add a customer before creating a work order.'
    end

    @work_order = WorkOrder.new
    @work_order.line_items.build
  end

  # GET /work_orders/1/edit
  def edit
  end

  # POST /work_orders
  def create
    @work_order = WorkOrder.new(work_order_params)

    if @work_order.save
      redirect_to @work_order, notice: 'Work order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /work_orders/1
  def update
    if @work_order.update(work_order_params)
      redirect_to @work_order, notice: 'Work order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /work_orders/1
  def destroy
    @work_order.destroy
    redirect_to work_orders_url, notice: 'Work order was successfully destroyed.'
  end

  def mark_completed
    if @work_order.update(work_order_params) && @work_order.complete!
      redirect_to @work_order, notice: 'Work order was completed.'
    else
      redirect_to @work_order, alert: 'There was a problem completing this work order'
    end
  end

  def workflow
    @work_orders = WorkOrder.where('date_completed IS NULL').order(date_due: :asc)
  end

  def quality_assurance_approval
    quality_assurance_approval = @work_order.quality_assurance_approvals.build(
      user_id: current_user.id
    )

    if quality_assurance_approval.save!
      redirect_to @work_order, notice: 'Quality Assurance approval was submitted.'
    else
      redirect_to @work_order, alert: 'The was a problem processing this Quality Assurance approval.'
    end
  end

  private
    def assert_company!
      if params[:customer_id].blank?
        redirect_to root_path, alert: "You must create a work order from a company's account."
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
    end

    def set_customer
      if params[:customer_id] || @work_order.customer_id
        @customer = Customer.find( params[:customer_id] || @work_order.customer_id)
      end
    end

    def work_order_statuses
      statuses = WorkOrder.statuses.reject { |status| status == 'complete' }
      statuses.reject { |status| status == 'ready_for_invoice' && !@work_order.quality_assurance_approval? }
    end

    def can_approve?
      return if current_user.can_approve_work_orders?
      redirect_to @work_order, alert: 'You are not authorized to approve this work order.'
    end

    # Only allow a trusted parameter "white list" through.
    def work_order_params
      params.require(:work_order).permit(:date_scheduled, :date_due, :customer_id, :contact_id, :packaging_details, :marked_completed_by, :date_completed, :name, :status, :production_stage_id, :estimated_price, attachments: [], service_ids: [], line_items_attributes: [:id, :description, :quantity, :notes, :powder_id, :_destroy, service_ids: []])
    end
end
