class ChampionshipsController < ApplicationController
  before_action :set_championship, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :champ_events, only: [:show]

  def index
    @championships = Championship.includes(:image_attachment, :logo_attachment, :events).order(name: :asc)
  end

  def new
    @championship = Championship.new
    authorize @championship
  end

  def show
    @champ_events = @championship.events
  end

  def create
    @championship = Championship.new(championship_params)
    authorize @championship

    if @championship.save
      redirect_to @championship, notice: 'Championship was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @championship, :edit?
  end

  def update
    authorize @championship, :update?
    social_media_params = params[:championship][:social_media] || {}
    @championship.social_media = {} unless @championship.social_media.is_a?(Hash)
    @championship.social_media[:facebook] = social_media_params[:facebook]
    @championship.social_media[:instagram] = social_media_params[:instagram]

    if @championship.update(championship_params)
      redirect_to @championship, notice: 'Championship was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @championship, :destroy?
    @championship.destroy
    redirect_to championships_url, notice: 'Championship was successfully destroyed.'
  end

  private

  def champ_events
    @champ_events = @championship.events
  end

  def set_championship
    @championship = Championship.find(params[:id])
  end

  def championship_params
    params.require(:championship).permit(:name, :description, :image, :logo, :price, :champ_type, :short_name, :licence,:long_name, :website, :email, :contact_number, :race_fee, :test_fee, :champ_fee, :tagline, :mobile, :home_track_id, :non_member_race_fee,:social_media => {})
  end

end