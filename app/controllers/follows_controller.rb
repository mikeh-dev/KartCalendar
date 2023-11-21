class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_followable, only: [:create]

  def create
    follow = current_user.follows.new(followable: @followable)
    if follow.save
      redirect_back(fallback_location: root_path, notice: 'Successfully followed!')
    else
      redirect_back(fallback_location: root_path, alert: 'Unable to follow.')
    end
  end

  def destroy
    follow = current_user.follows.find_by(id: params[:id])
    if follow&.destroy
      redirect_back(fallback_location: root_path, notice: 'Successfully Removed.')
    else
      redirect_back(fallback_location: root_path, alert: 'There has been an error!')
    end
  end

  private

  def set_followable
    @followable = params[:followable_type].classify.constantize.find(params[:followable_id])
  rescue NameError
    redirect_to root_path, alert: 'Invalid followable type.'
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Followable not found.'
  end
end
