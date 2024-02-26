class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @followed_championships = current_user.followed_championships.includes(:events)
    @followed_tracks = current_user.followed_tracks.includes(:events)
    @followed_events = current_user.followed_events.includes(:championship, :track)
    
    @timeline_events = Event.where(championship: @followed_championships)
                        .or(Event.followed_by(current_user))
                        .order('start_date ASC')
                        .where("start_date >= ?", Date.today)
                        .limit(15)
    @display_month = params[:month] ? Date.parse(params[:month]) : Date.today
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
end