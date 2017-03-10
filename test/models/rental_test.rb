require 'test_helper'

class RentalTest < ActiveSupport::TestCase
  test 'should say the rental is finished when finish date is set' do
    assert_not rentals(:started).finished?
    assert rentals(:finished).finished?
  end

  test 'should set the start date of rental to today automatically' do
    rental = Rental.create(user: users(:one), book: books(:never_rented))
    assert_equal Date.today, rental.start_date
    assert_not_equal rental.start_date, rental.due_date
  end

  test 'should set the due date of rental to some future date automatically' do
    rental = Rental.create(user: users(:one), book: books(:never_rented))
    assert rental.start_date < rental.due_date
  end
end
