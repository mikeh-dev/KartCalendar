class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @display_month = params[:month] ? Date.parse(params[:month]) : Date.today
    @timeline_events = Event.where(championship: @followed_championships)
                        .or(Event.followed_by(current_user))
                        .order('start_date ASC')
                        .where("start_date >= ?", Date.today)
                        .limit(15)
    @engines = current_user.engines
    @service_records = ServiceRecord.joins(:engine).where(engines: { user_id: current_user.id }).order('date DESC')
    @managed_tracks = current_user.managed_tracks.includes(:events)
    @managed_championships = current_user.managed_championships.includes(:events)
  end

  def check
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    events = Event.where(id: current_user.followed_events.select(:id))
    .or(Event.where(championship: @followed_championships))

    render json: (start_date..end_date).map { |date|
      {
        date: date,
        events: events.any? { |e| e.start_date <= date && e.end_date >= date }
      }
    }
  end
end