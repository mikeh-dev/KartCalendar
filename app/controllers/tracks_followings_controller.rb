class TrackFollowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_track

  def create
    current_user.followed_tracks << @track unless current_user.followed_tracks.include?(@track)
    redirect_to @track
  end

  def destroy
    track_following = current_user.track_followings.find_by(track_id: @track.id)
    track_following&.destroy
    redirect_to @track
  end

  private

  def set_track
    @track = Track.find(params[:track_id])
  end
end