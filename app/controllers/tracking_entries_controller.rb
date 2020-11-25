class TrackingEntriesController < ApplicationController
  before_action :set_tracking_entry, only: [:show, :edit, :update, :destroy]

  # GET /tracking_entries
  def index
    @tracking_entries = TrackingEntry.all
  end

  # GET /tracking_entries/1
  def show
  end

  # GET /tracking_entries/new
  def new
    @tracking_entry = TrackingEntry.new
  end

  # GET /tracking_entries/1/edit
  def edit
  end

  # POST /tracking_entries
  def create
    @tracking_entry = TrackingEntry.new(tracking_entry_params)

    if @tracking_entry.save
      redirect_to @tracking_entry, notice: 'Tracking entry was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tracking_entries/1
  def update
    if @tracking_entry.update(tracking_entry_params)
      redirect_to @tracking_entry, notice: 'Tracking entry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tracking_entries/1
  def destroy
    @tracking_entry.destroy
    redirect_to tracking_entries_url, notice: 'Tracking entry was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracking_entry
      @tracking_entry = TrackingEntry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tracking_entry_params
      params.require(:tracking_entry).permit(:start_time, :end_time, :deleted_at, :service_id)
    end
end
