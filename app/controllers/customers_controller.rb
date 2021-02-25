class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: %i[show edit update destroy]

  # GET /customers
  def index
    @customers = Customer.all

    respond_to do |format|
      format.html # index.html.erb
      format.csv { send_data @customers.to_csv, filename: "customers-#{Date.today}.csv" }
    end
  end

  # GET /customers/1
  def show
    @notes = @customer.notes.page(params[:page])
    @note = @notes.build
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit; end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer, notice: 'Customer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def customer_params
    params.require(:customer).permit(:name, :phone, :email, :fax, :address1, :address2, :city,
                                     :state, :zip_code, :primary_contact_id, :account_type, attachments: [])
  end
end
