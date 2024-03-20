class EnginesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_engine, only: [:show, :edit, :update, :destroy]

  def new
    @engine = Engine.new
  end

  def create
    @engine = Engine.new(engine_params)
    @engine.user = current_user
    if @engine.save
      redirect_to new_engine_path, notice: 'Engine added successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def index
    @engines = current_user.engines
  end

  def edit
  end

  def update
    @engine = Engine.find(params[:id])
    if @engine.update(engine_params)
      redirect_to engines_path, notice: 'Engine updated successfully'
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
    params.require(:engine).permit(:engine_number, :engine_make, :engine_model, :barrel_number, :seal_number, :year_manufactured, photos: [])
  end
  

  def set_engine
    @engine = Engine.find(params[:id])
  end

end
