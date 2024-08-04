class EnginePolicy < ApplicationPolicy
  def show?
    user.admin? || record.user == user
  end

  def create?
    user.present?
  end

  def update?
    user.admin? || record.user == user
  end

  def destroy?
    user.admin?
  end
end