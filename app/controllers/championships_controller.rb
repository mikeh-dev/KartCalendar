class ChampionshipsController < ApplicationController
  before_action :set_championship, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @championships = Championship.all
    @next_championships = Championship.joins(:events)
                            .where(events: { event_type: "Race" })
                            .where(events: { date: Date.today..(Date.today + 6.days) })
                            .distinct
  end

  def new
    @championship = Championship.new
  end

  def show
    @championships = Championship.all
    @champ_events = @championship.events
  end

  def create
    @championship = Championship.new(championship_params)
    @championship.image = params[:championship][:image]

    if @championship.save
      redirect_to @championship, notice: 'Championship was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @championship.update(championship_params)
      redirect_to @championship, notice: 'Championship was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @championship.destroy
    redirect_to championships_url, notice: 'Championship was successfully destroyed.'
  end

  private

  def set_championship
    @championship = Championship.find(params[:id])
  end

  def championship_params
    params.require(:championship).permit(:name, :description, :image, :logo, :price, :type)
  end

end
