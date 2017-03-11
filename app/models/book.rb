class Book < ApplicationRecord
  has_many :rentals
  has_many :users, through: :rentals
  validates :title, :author, presence: true

  def rented?
    return rentals.where(finish_date: nil).any?
  end
end
