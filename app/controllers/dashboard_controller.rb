class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @followed_championships = current_user.championships.includes(:events)
    
    @timeline_events = Event.where(championship: @followed_championships)
                            .order('date ASC')
                            .limit(50)
  end
end
