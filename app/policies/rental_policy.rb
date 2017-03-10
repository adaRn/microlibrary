class RentalPolicy < ApplicationPolicy
  def finish?
    (record.user == user && record.finish_date == nil)
  end
end
