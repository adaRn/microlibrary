class UserPolicy < ApplicationPolicy
  def edit?
    record == user
  end

  def destroy?
    false
  end

  def update?
    edit?
  end
end
