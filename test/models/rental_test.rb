require 'test_helper'

class RentalTest < ActiveSupport::TestCase
  test 'should say the rental is finished when finish date is set' do
    assert_not rentals(:one).finished?
    assert rentals(:finished).finished?
  end
end
