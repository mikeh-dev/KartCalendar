class ServiceRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_engine
  before_action :set_service_record, only: [:show, :edit, :update, :destroy]

  def new
    @service_record = @engine.service_records.new
  end

  def create
    @service_record = @engine.service_records.new(service_record_params)
    @service_record.user = current_user
    if @service_record.save
      redirect_to [@engine, @service_record], notice: 'Service record added successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def index
    @service_records = @engine.service_records
  end

  def edit
  end

  def update
    if @service_record.update(service_record_params)
      redirect_to engine_service_records_path(@engine), notice: 'Service record updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service_record.destroy
    redirect_to service_records_path, notice: 'Service record deleted successfully'
  end

  private

  def set_engine
    @engine = current_user.engines.find(params[:engine_id])
  end

  def set_service_record
    @service_record = @engine.service_records.find(params[:id])
  end

  def service_record_params
    params.require(:service_record).permit(:date, :description, :invoice, dyno_sheets: [])
  end

end
