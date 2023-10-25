class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: %i[index show test_events race_events]

  def test_events
    @test_events = Event.where(event_type: 'Test').order(date: :asc)
    @next_test_events = Event.where(events: { event_type: "Test" })
                            .where(events: { date: Date.today..(Date.today + 6.days) })
                            .distinct
  end

  def race_events
    @race_events = Event.where(event_type: 'Race').order(date: :asc)
    @next_race_events = Event.where(events: { event_type: "Race" })
                            .where(events: { date: Date.today..(Date.today + 6.days) })
                            .distinct
  end

  def index
    @events = Event.all.order(date: :asc)
    @next_events = Event.where('date >= ?', Date.today).order(date: :asc).first
  end

  def show
    @events = Event.where("track_id = ? AND date >= ?", @event.track_id, Date.today)
    @championship = @event.championship
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

private

def set_event
  @event = Event.find(params[:id])
end

def event_params
  params.require(:event).permit(:title, :description, :date, :price, :event_type, :image, :championship_id, :track_id)
end
  
end