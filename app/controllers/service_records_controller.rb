class ServiceRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service_record, only: [:show, :edit, :update, :destroy]

  def new
    @service_record = ServiceRecord.new
  end

  def create
    @service_record = ServiceRecord.new(service_record_params)
    @service_record.user = current_user
    if @service_record.save
      redirect_to new_service_record_path, notice: 'Service record added successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def index
    @service_records = current_user.service_records
  end

  def edit
  end

  def update
    if @service_record.update(service_record_params)
      redirect_to service_records_path, notice: 'Service record updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service_record.destroy
    redirect_to service_records_path, notice: 'Service record deleted successfully'
  end

  private

  def set_service_record
    @service_record = ServiceRecord.find(params[:id])
  end

  def service_record_params
    params.require(:service_record).permit(:date, :description, :engine_id, invoices: [])
  end

end
