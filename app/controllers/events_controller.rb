class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: %i[index show test_events race_events]
  before_action :ensure_admin_user!, except: %i[index show test_events race_events]

  def test_events
    @test_events = Event.where(event_type: 'Test')
                      .where("start_date >= ?", Date.today)
                      .order(start_date: :asc)
    @this_weekends_test_events = Event.where(event_type: 'Test')
                      .where("start_date >= ? AND start_date <= ?", Date.today, Date.today + 6.days)
                      .order(start_date: :asc)
  end

  def race_events
    @race_events = Event.where(event_type: 'Race')
                      .where("start_date >= ?", Date.today)
                      .order(start_date: :asc)
    @this_weekends_race_events = Event.where(event_type: 'Race')
                      .where("start_date >= ? AND start_date <= ?", Date.today, Date.today + 6.days)
                      .order(start_date: :asc)
  end

  def index
    selected_date = params[:date]
    @events = Event.where('start_date <= ? AND end_date >= ?', selected_date, selected_date)
    @today = Date.today
  end

  def show
    @championship = @event.championship
    @events = Event.where(championship: @championship)
                 .where('start_date >= ? AND id != ?', Date.today, @event.id)
                 .order(start_date: :asc)
    mapbox_service = MapboxService.new
    hotel_response = mapbox_service.search_category(@event.track.longitude, @event.track.latitude, 'hotel')
    @hotels = JSON.parse(hotel_response.body) if hotel_response.success?
    fuel_response = mapbox_service.search_category(@event.track.longitude, @event.track.latitude, 'fuel')
    @fuel_stations = JSON.parse(fuel_response.body) if fuel_response.success?
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.image = params[:event][:image]
    
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  def check
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    events = Event.where('start_date <= :end_date AND end_date >= :start_date', start_date: start_date, end_date: end_date).select(:start_date, :end_date)
    render json: (start_date..end_date).map { |date|
      {
        date: date,
        events: events.any? { |e| e.start_date <= date && e.end_date >= date }
      }
    }
  end

private

def set_event
  @event = Event.includes(:categories).find(params[:id])
end

def event_params
  params.require(:event).permit(:title, :description, :start_date, :end_date, :price, :event_type, :image, :championship_id, :track_id, category_ids: [])
end
  
end