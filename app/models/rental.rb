class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :book
  before_create :set_start_and_due_date

  def finished?
    !finish_date.nil?
  end

  private

    def set_start_and_due_date
      self.start_date = Date.today
      self.due_date = 14.days.from_now
    end
end
