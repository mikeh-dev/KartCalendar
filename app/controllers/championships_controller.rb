class ChampionshipsController < ApplicationController
  before_action :set_championship, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @championships = Championship.all.order(name: :asc).includes(:image_attachment, :logo_attachment, :events)
  end

  def new
    @championship = Championship.new
    authorize @championship
  end

  def show
    @champ_events = @championship.events
    @future_champ_events = @champ_events.where("start_date >= ?", Date.tomorrow).order(start_date: :asc)
    @past_champ_events = @champ_events.where("end_date < ?", Date.today).order(start_date: :desc)
  end

  def create
    @championship = Championship.new(championship_params)
    @championship.image = params[:championship][:image]
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

  def set_championship
    @championship = Championship.find(params[:id])
  end

  def championship_params
    params.require(:championship).permit(:name, :description, :image, :logo, :price, :champ_type, :short_name, :licence,:long_name, :website, :email, :contact_number, :race_fee, :test_fee, :champ_fee, :tagline, :mobile, :home_track_id, :non_member_race_fee,:social_media => {})
  end

end