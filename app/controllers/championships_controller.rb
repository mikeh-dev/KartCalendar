class ChampionshipsController < ApplicationController
  def index
    @championships = Championship.all
  end

  def new
    @championship = Championship.new
  end

  def show
    @championship = Championship.find(params[:id])
  end

  def create
    
  end

  def edit
  end

  def destroy
  end
end
