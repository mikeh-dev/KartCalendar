class EventPolicy < ApplicationPolicy
  attr_reader :user, :event

  def initialize(user, event)
    @user = user
    @event = event
  end

  def create?
    user.admin? || (user.manager? && user.tracks.include?(event.track))
  end

  def show?
    true
  end

  def index?
    true
  end

  def update?
    edit?
  end

  def destroy?
    user.admin? || (user.manager? && user.tracks.include?(event.track))
  end

  def new?
    user.admin? || user.manager?
  end

  def edit?
    user.admin? || (user.manager? && user.tracks.include?(event.track))
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.manager?
        scope.where(track: user.tracks)
      else
        scope.none # or scope.where(public: true) for public events
      end
    end
  end

end
