class ServiceRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_engine
  before_action :set_service_record, only: [:show, :edit, :update, :destroy]

  def new
    @service_record = @engine.service_records.new
    @engines = current_user.engines
  end

  def create
    @engine = current_user.engines.find_by(id: params[:service_record][:engine_id])
    @service_record = @engine.service_records.new(service_record_params)
    @service_record.user = current_user
    if @service_record.save
      redirect_to [@engine, @service_record], notice: 'Service record added successfully'
    else
      @engines = current_user.engines
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def index
    @engine = current_user.engines.find(params[:engine_id])
    @service_records = @engine.service_records
  end

  def edit
    @engines = current_user.engines
  end

  def update
    if @service_record.update(service_record_params)
      redirect_to engine_path(@engine), notice: 'Service record updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service_record.destroy
    redirect_to engine_path(@engine), notice: 'Service record deleted successfully'
  end

  private

  def set_engine
    @engine = current_user.engines.find(params[:engine_id])
    logger.debug "Engine: #{@engine}"
  end

  def set_service_record
    @service_record = @engine.service_records.find(params[:id])
  end

  def service_record_params
    params.require(:service_record).permit(:date, :description, :invoice, :engine_builder, :notes, :seal_number, :engine_id, dyno_sheets: [])
  end

end
