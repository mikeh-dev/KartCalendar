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

                        # Find events for the displayed month
                        @events = Event.where('start_date >= ? AND start_date <= ?', @display_month.beginning_of_month, @display_month.end_of_month)
                    
                        # Calculate next and previous months for navigation links
                        @next_month = (@display_month + 1.month).to_s
                        @prev_month = (@display_month - 1.month).to_s
  
  end
end