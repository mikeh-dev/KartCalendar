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
end