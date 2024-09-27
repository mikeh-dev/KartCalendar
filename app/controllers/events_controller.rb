class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: %i[index show test_events race_events check check_race check_test]
  before_action :ensure_admin_user!, except: %i[index show test_events race_events check check_race check_test create update new edit]

  def index
    selected_date = params[:date]
    @future_events = Event.future_events
    @events = Event.on_date(selected_date)
    @this_weekends_events = Event.this_weekends_events
  end

  def show
    @event = Event.includes(:championship, :track).find(params[:id])
    
    @future_championship_events = Event.future_events
                   .where(championship: @event.championship)
                   .where.not(id: @event.id)
                   .order(start_date: :asc)

    @future_track_events = Event.future_events
                   .where(track: @event.track)
                   .where.not(id: @event.id)
                   .order(start_date: :asc)
  
    weather_service = WeatherService.new
    @weather_forecast = weather_service.parsed_weather_forecast(@event.track.longitude, @event.track.latitude)

    mapbox_service = MapboxService.new
    @hotels = mapbox_service.fetch_hotels(@event.track.longitude, @event.track.latitude)
    @fuel_stations = mapbox_service.fetch_fuel_stations(@event.track.longitude, @event.track.latitude)
  end

  def new
    @event = Event.new
    authorize @event, :new?
    @event.track = current_user.tracks.first if current_user.manager? && current_user.tracks.count == 1
  end

  def create
    @event = Event.new(event_params)
    @event.image = params[:event][:image]
    authorize @event, :create?
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @event, :edit?
  end

  def update
    authorize @event, :update?
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully deleted.'
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

  def check_race
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    events = Event.where('start_date <= :end_date AND end_date >= :start_date AND event_type = :event_type', start_date: start_date, end_date: end_date, event_type: "Race").select(:start_date, :end_date)
    render json: (start_date..end_date).map { |date|
      {
        date: date,
        events: events.any? { |e| e.start_date <= date && e.end_date >= date }
      }
    }
  end

  def check_test
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    events = Event.where('start_date <= :end_date AND end_date >= :start_date AND event_type = :event_type', start_date: start_date, end_date: end_date, event_type: "Test").select(:start_date, :end_date)
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
  params.require(:event).permit(:title, :description, :price, :event_type, :image, :championship_id, :track_id, :start_date, :end_date, :licence, category_ids: [])
end
  
end