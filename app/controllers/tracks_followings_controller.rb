class TrackFollowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_track

  def create
    unless current_user.track_followings.exists?(track: @track)
      current_user.track_followings.create(track: @track)
    end
    redirect_to @track
  end  

  def destroy
    track_following = current_user.track_followings.find_by(track: @track)
    track_following&.destroy
    redirect_to @track
  end  

  private

  def set_track
    @track = Track.find(params[:track_id])
  end
end