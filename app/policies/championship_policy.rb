class ChampionshipPolicy < ApplicationPolicy
  attr_reader :user, :championship

  def initialize(user, championship)
    @user = user
    @championship = championship
  end

  def show?
    true
  end

  def create?
    user&.admin?
  end

  def update?
    edit?
  end

  def edit?
    user&.admin? || (user&.manager? && championship.user_id == user.id)
  end

  def destroy?
    user&.admin?
  end

  def index?
    true
  end

  class Scope < Scope
    def resolve
     if user&.admin?
       scope.all
     else
       scope.where(user: @user)
     end
    end
  end

  private

end