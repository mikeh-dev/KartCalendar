class Api::V1::EventsController < ApplicationController
  before_action :authenticate_with_api_key

  def index
    @events = Event.select(:id, :title, :start_date).all
    render json: @events.to_json(only: [:id, :title, :start_date])
  end

  def show
    @event = Event.find(params[:id])
    render json: @event.to_json(only: [:id, :title, :start_date, :end_date])
  end

  private

  def authenticate_with_api_key
    api_key = request.headers['X-Api-Key'] || params[:api_key]
    unless ApiKey.exists?(key: api_key)
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

end
