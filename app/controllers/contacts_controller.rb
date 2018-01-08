class ContactsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_customer, only: [:new, :edit, :update, :create]

  # GET /contacts
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  def show
  end

  # GET /contacts/new
  def new
    if @customer
      @contact = @customer.contacts.build
    else
      @contact = Contact.new
    end
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  def create
    if @customer
      @contact = @customer.contacts.new(contact_params)
    else
      @contact = Contact.new(contact_params)
    end

    if @contact.save
      if contact_params[:make_primary_contact] == '1' && @customer
        @customer.update(primary_contact_id: @contact.id)
      end
      
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      if contact_params[:make_primary_contact] == '1' && @customer
        @customer.update(primary_contact_id: @contact.id)
      end

      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def set_customer
      if @contact && @contact.customer_id
        @customer = Customer.find @contact.customer_id
      elsif params[:customer_id]
        @customer = Customer.find params[:customer_id]
      elsif contact_params[:customer_id]
        @customer = Customer.find contact_params[:customer_id]
      end
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(%i(first_name last_name phone email title customer_id make_primary_contact))
    end
end
