class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def finished?
    !finish_date.nil?
  end
end
