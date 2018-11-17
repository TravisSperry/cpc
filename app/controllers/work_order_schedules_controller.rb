class WorkOrderSchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_work_order_schedule, only: [:show, :edit, :update, :destroy]

  # GET /work_order_schedules
  def index
    @work_order_schedules = WorkOrderSchedule.all
  end

  # GET /work_order_schedules/1
  def show
  end

  # GET /work_order_schedules/new
  def new
    @work_order_schedule = WorkOrderSchedule.new
    @work_order_schedule.service_schedules.build
  end

  # GET /work_order_schedules/1/edit
  def edit
  end

  # POST /work_order_schedules
  def create
    @work_order_schedule = WorkOrderSchedule.new(work_order_schedule_params)

    if @work_order_schedule.save
      redirect_to @work_order_schedule, notice: 'Work order schedule was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /work_order_schedules/1
  def update
    if @work_order_schedule.update(work_order_schedule_params)
      redirect_to @work_order_schedule, notice: 'Work order schedule was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /work_order_schedules/1
  def destroy
    @work_order_schedule.destroy
    redirect_to work_order_schedules_url, notice: 'Work order schedule was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order_schedule
      @work_order_schedule = WorkOrderSchedule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def work_order_schedule_params
      params.require(:work_order_schedule).permit(:work_order_id, service_schedule_attributes: [:start_date, :end_date, :service_id])
    end
end
