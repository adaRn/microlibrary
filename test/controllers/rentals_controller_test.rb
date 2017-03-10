require 'test_helper'

class RentalsControllerTest < ActionDispatch::IntegrationTest
  # Although it's a test of controller, it inherits after
  # ActionDispatch::IntegrationTest, so it has to get Integration test helpers
  # from Devise, not Controller test helpers.
  # See https://github.com/plataformatec/devise/issues/4191
  include Devise::Test::IntegrationHelpers

  setup do
    @user = create(:user)
    sign_in @user
  end

  test 'should get a list of rentals' do
    get rentals_url
    assert_response :success
  end

  test 'should rent a book' do
    assert_difference 'Rental.count', +1 do
      get rental_create_url(books(:one).id)
    end
    assert_redirected_to books_url
  end
end
