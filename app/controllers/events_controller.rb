class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    @next_event = Event.where('date >= ?', Date.today).order(date: :asc).first
  end

  def show
    @event = Event.find_by_id(params[:id])
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

private

def set_event
  @event = Event.find(params[:id])
end

def event_params
  params.require(:event).permit(:title, :description, :date, :price, :event_type, :image)
end
  
end