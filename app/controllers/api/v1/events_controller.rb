class Api::V1::EventsController < ApplicationController

  def index
    @events = Event.all
    render json: @events.to_json(only: [:id, :name, :description, :start_date, :end_date])
  end

  def show
    @event = Event.find(params[:id])
    render json: @event.to_json(only: [:id, :name, :description, :start_date, :end_date])
  end

end
