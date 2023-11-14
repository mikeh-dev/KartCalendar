class ChampionshipFollowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_championship

  def create
    unless current_user.championship_followings.exists?(championship: @championship)
      current_user.championship_followings.create(championship: @championship)
      @championship.events.each do |event|
        current_user.events << event unless current_user.events.include?(event)
      end
    end
    redirect_to championship_path(@championship)
  end

  def destroy
    championship_following = current_user.championship_followings.find_by(championship: @championship)
    championship_following.destroy if championship_following
  
    @championship.events.each do |event|
      current_user.events.delete(event)
    end
  
    redirect_to championship_path(@championship)
  end
  

  private

  def set_championship
    @championship = Championship.find(params[:id])
  end
end