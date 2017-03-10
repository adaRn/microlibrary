require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'rented? should tell if the books is currently rented' do
    assert_not books(:never_rented).rented?
    assert books(:rented).rented?
    assert_not books(:returned).rented?
  end
end
