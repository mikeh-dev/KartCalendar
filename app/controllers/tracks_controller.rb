class TracksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @tracks = Track.includes(:events).order(:name)
    @upcoming_tracks = Track.joins(:events).where("events.date >= ? AND events.date <= ?", Date.today, Date.today + 6.days).distinct
  end

  def show
    @future_track_events = @track.events.where('date >= ?', Date.today).order(date: :asc)
    @next_event = @future_track_events.first
    @track_events = @track.events.order(date: :asc)
    @track_race_events = @track.events.where(event_type: "Race")
    @track_test_events = @track.events.where(event_type: "Test")
    @next_race_event = @track_race_events.first
    @next_test_event = @track_test_events.first
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
  end

  def update
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
    params.require(:track).permit(:name, :address, :contact_number, :main_image, :length, :email, :race_image, :description, :location, :logo, :short_desc, :test_image, :champ_image, :tagline, :website, :mobile, :contact_image, :static_map_url, :facebook, :instagram, facilities: [])
  end
  
end
