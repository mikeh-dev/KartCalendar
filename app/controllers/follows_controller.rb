class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_followable, only: [:create]

  def create
    follow = current_user.follows.new(followable: @followable)
    if follow.save
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

  def set_followable
    klass = params[:followable_type].classify.constantize
    @followable = klass.find(params[:followable_id])
  rescue NameError, ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Invalid or not found followable.'
  end
  
end
