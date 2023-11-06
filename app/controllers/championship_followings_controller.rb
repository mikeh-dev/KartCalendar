# app/controllers/championship_followings_controller.rb
class ChampionshipFollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @championship = Championship.find(params[:championship_id])
    current_user.championships << @championship unless current_user.championships.include?(@championship)
    # Optionally follow all events of the championship
    @championship.events.each { |event| current_user.events << event unless current_user.events.include?(event) }
    redirect_to championship_path(@championship)
  end

  def destroy
    @championship = Championship.find(params[:id])
    current_user.championships.delete(@championship)
    # Optionally unfollow all events of the championship
    @championship.events.each { |event| current_user.events.delete(event) }
    redirect_to championship_path(@championship)
  end
end