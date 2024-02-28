class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_followable, only: [:create]

  def create
    follow = current_user.follows.new(followable: @followable)
    if follow.save
      FollowChampionshipEventsService.new(user: current_user, championship: @followable).call if @followable.is_a?(Championship)

      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.turbo_stream
      end
    else
      redirect_back(fallback_location: root_path, alert: 'Unable to follow.')
    end
  end

  def destroy
    follow = current_user.follows.find_by(id: params[:id])
    if follow
      @followable = follow.followable
      if @followable.is_a?(Championship)
        unfollow_championship_events(@followable)
      end
      follow.destroy
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.turbo_stream
      end
    else
      redirect_back(fallback_location: root_path, alert: 'There has been an error!')
    end
  end

  private

  ALLOWED_FOLLOWABLE_TYPES = ['Track', 'Event', 'Championship'].freeze

  def set_followable
    followable_type = params[:followable_type].classify
    if ALLOWED_FOLLOWABLE_TYPES.include?(followable_type)
      klass = followable_type.constantize
      @followable = klass.find(params[:followable_id])
    else
      redirect_to root_path, alert: 'Invalid or not found followable.'
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Invalid or not found followable.'
  end

  def unfollow_championship_events(championship)
    championship.events.each do |event|
      current_user.follows.where(followable: event).destroy_all
    end
  end
  
end
