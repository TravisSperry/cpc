class WorkOrdersController < ApplicationController
  before_action :set_work_order, only: [:show, :edit, :update, :destroy]
  before_action :set_customer, only: [:new, :edit]

  # GET /work_orders
  def index
    @work_orders = WorkOrder.all
  end

  # GET /work_orders/1
  def show
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
    end

    def set_customer
      if params[:customer_id] || @work_order.customer_id
        @customer = Customer.find( params[:customer_id] || @work_order.customer_id)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def work_order_params
      params.require(:work_order).permit(:date_scheduled, :date_due, :customer_id, :contact_id, :packaging_details, :date_completed,
      line_items_attributes: [:id, :description, :quantity, :notes, :_destroy])
    end
end
