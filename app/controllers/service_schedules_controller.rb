class ServiceSchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service_schedule, only: [:show, :edit, :update, :destroy]

  # GET /service_schedules
  def index
    @service_schedules = ServiceSchedule.all
  end

  # GET /service_schedules/1
  def show
  end

  # GET /service_schedules/new
  def new
    @service_schedule = ServiceSchedule.new
  end

  # GET /service_schedules/1/edit
  def edit
  end

  # POST /service_schedules
  def create
    @service_schedule = ServiceSchedule.new(service_schedule_params)

    if @service_schedule.save
      redirect_to @service_schedule, notice: 'Service schedule was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /service_schedules/1
  def update
    if @service_schedule.update(service_schedule_params)
      redirect_to @service_schedule, notice: 'Service schedule was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /service_schedules/1
  def destroy
    @service_schedule.destroy
    redirect_to service_schedules_url, notice: 'Service schedule was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_schedule
      @service_schedule = ServiceSchedule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def service_schedule_params
      params.require(:service_schedule).permit(:work_order_schedule_id, :service_id, :start_date, :end_date, :note)
    end
end
