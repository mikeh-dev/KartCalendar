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
    if @engine.update(engine_params.except(:engine_photos, :existing_photos))
      # Update the enging photos to upload with a background job
      redirect_to @engine, notice: 'Engine was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @engine.destroy
    redirect_to engines_path, notice: 'Engine deleted successfully'
  end

  def remove_image
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    redirect_to edit_engine_path(@image.record), notice: 'Image removed successfully'
  end

  private

  def engine_params
    params.require(:engine).permit(:name, :engine_number, :engine_make, :engine_model, :barrel_number, :seal_number, :year_manufactured, :notes, :logbook_cover, engine_images: [], dyno_sheet: [])
  end

  def set_engine
    @engine = Engine.find(params[:id])
  end

  def authorize_engine
    authorize @engine
  end
end