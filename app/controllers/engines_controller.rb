class EnginesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_engine, only: [:show, :edit, :update, :destroy]
  before_action -> { authorize_user(@engine) }, only: [:show, :edit, :update, :destroy, :index, :new, :create]
  

  def new
    @engine = Engine.new
  end

  def create
    @engine = Engine.new(engine_params)
    @engine.user = current_user
    if @engine.save
      redirect_to engine_path(@engine), notice: 'Engine added successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def index
    @engines = current_user.admin? ? Engine.all : current_user.engines
  end

  def edit
  end

  def update
    if @engine.update(engine_params)
      redirect_to engine_path(@engine), notice: 'Engine updated successfully'
    else
      render :edit, status: :unprocessable_entity
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

  

end