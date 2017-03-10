class RentalPolicy < ApplicationPolicy
  def finish?
    record.user == user
  end
end
