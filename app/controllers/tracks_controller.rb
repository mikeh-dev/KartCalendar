class TracksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin_user!, only: [:new, :create, :destroy]
  
  def index
    @tracks = Track.select(:id, :name, :location)
                   .includes(:main_image_attachment)
                   .left_joins(:events)
                   .group('tracks.id')
                   .order('tracks.name')

    @mapbox_access_token = mapbox_access_token
    
  end

  def show
    @future_track_events = @track.future_events
    @next_event = @track.next_track_event
    @track_events = @track.events.order(start_date: :asc)
    @track_race_events = @track.race_events
    @track_test_events = @track.test_events
    @next_race_event = @track.next_race_event
    @next_test_event = @track.next_test_event

    mapbox_service = MapboxService.new
    hotel_response = mapbox_service.search_category(@track.longitude, @track.latitude, 'hotel')
    @hotels = JSON.parse(hotel_response.body) if hotel_response.success?
    fuel_response = mapbox_service.search_category(@track.longitude, @track.latitude, 'fuel')
    @fuel_stations = JSON.parse(fuel_response.body) if fuel_response.success?
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

  def mapbox_access_token
    @mapbox_access_token ||= ENV['MAPBOX_ACCESS_TOKEN']
  end
end
