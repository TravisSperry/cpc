module Customers
  class PartsController < ApplicationController
    load_and_authorize_resource :customer
    load_and_authorize_resource through: :customer

    # GET /customers/parts
    def index
      @customer_parts = Part.all
    end

    # GET /customers/parts/1
    def show
    end

    # GET /customers/parts/new
    def new
      @part = Part.new
    end

    # GET /customers/parts/1/edit
    def edit
    end

    # POST /customers/parts
    def create
      @part = Part.new(part_params)

      if @part.save
        redirect_to customer_part_path(id: @part.id), notice: 'Part was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /customers/parts/1
    def update
      if @part.update(part_params)
        redirect_to customer_part_path(@part), notice: 'Part was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /customers/parts/1
    def destroy
      @part.destroy
      redirect_to parts_url, notice: 'Part was successfully destroyed.'
    end

    private

      # Only allow a trusted parameter "white list" through.
      def part_params
        params
          .require(:part)
          .permit(:sku, :label, :description)
          .merge(customer_id: params[:customer_id])
      end
  end
end
