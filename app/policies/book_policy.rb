class BookPolicy < ApplicationPolicy
  def rent?
    !record.rented?
  end
end
