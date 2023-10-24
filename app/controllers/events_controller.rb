class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: %i[index show test_events race_events]

  def test_events
    @test_events = Event.where(event_type: 'Test')
  end

  def race_events
    @race_events = Event.where(event_type: 'Race')
  end

  def index
    @events = Event.all
    @next_event = Event.where('date >= ?', Date.today).order(date: :asc).first
  end

  def show
    @events = Event.all
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
  params.require(:event).permit(:title, :description, :date, :price, :event_type, :image)
end
  
end