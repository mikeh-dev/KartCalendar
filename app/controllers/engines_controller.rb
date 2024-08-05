class EnginesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_engine, only: [:show, :edit, :update, :destroy]
  before_action :authorize_engine, only: [:show, :edit, :update, :destroy]

  def new
    @engine = Engine.new
    authorize @engine
  end

  def create
    @engine = Engine.new(engine_params)
    @engine.user = current_user
    authorize @engine
    if @engine.save
      redirect_to engine_path(@engine), notice: 'Engine added successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def index
    @engines = current_user.engines
    @all_engines = Engine.all
  end

  def edit
  end

  def update
    if params[:engine][:existing_photos]
      params[:engine][:existing_photos].each do |photo_id|
        @engine.engine_photos.find(photo_id).purge
      end
    end

    if params[:engine][:engine_photos]
      params[:engine][:engine_photos].each do |photo|
        @engine.engine_photos.attach(photo)
      end
    end

    if @engine.update(engine_params.except(:engine_photos, :existing_photos))
      redirect_to @engine, notice: 'Engine was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @engine.destroy
    redirect_to engines_path, notice: 'Engine deleted successfully'
  end

  private

  def engine_params
    params.require(:engine).permit(:name, :engine_number, :engine_make, :engine_model, :barrel_number, :seal_number, :year_manufactured, :notes, :logbook_cover, engine_photos: [], dyno_sheet: [])
  end

  def set_engine
    @engine = Engine.find(params[:id])
  end

  def authorize_engine
    authorize @engine
  end
end