class TrackPolicy < ApplicationPolicy
  attr_reader :user, :track

  def initialize(user, track)
    @user = user
    @track = track
  end

  def show?
    true
  end

  def create?
    user.admin?
  end

  def update?
    user.admin? || user.manager? && record.user_id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end

  def index?
    true
  end

  class Scope < Scope
    def resolve
     if @user.admin?
       scope.all
     else
       scope.where(user: @user)
     end
    end
  end

  private


end