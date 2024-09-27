class TracksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin_user!, only: [:new, :create, :destroy]

  def index
    @tracks = Track.includes(:events, main_image_attachment: :blob)
  end

  def show
    @track = Track.includes(:events, main_image_attachment: :blob).find(params[:id])
    @future_track_events = @track.events.future_events
    @next_race_event = @track.next_race_event
    @next_test_event = @track.next_test_event

    mapbox_service = MapboxService.new
    @hotels = mapbox_service.fetch_hotels(@track.longitude, @track.latitude)
    @fuel_stations = mapbox_service.fetch_fuel_stations(@track.longitude, @track.latitude)
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to @track, notice: 'Track was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @track
  end

  def update
    authorize @track
    if @track.update(track_params)
      redirect_to @track, notice: 'Track was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @track.destroy
    redirect_to tracks_url, notice: 'Track was successfully destroyed.'
  end

  private

  def set_track
    @track = Track.find(params[:id])
  end

  def track_params
    params.require(:track).permit(:name, :address, :contact_number, :main_image, :length, :email, :race_image, :description, :location, :logo, :short_desc, :test_image, :champ_image, :tagline, :website, :mobile, :contact_image, :static_map_url, :facebook, :instagram, :latitude, :longitude, facilities: [], category_ids: [])
  end
  
end
