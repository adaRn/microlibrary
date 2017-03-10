require 'test_helper'

class RentalsControllerTest < ActionDispatch::IntegrationTest
  # Although it's a test of controller, it inherits after
  # ActionDispatch::IntegrationTest, so it has to get Integration test helpers
  # from Devise, not Controller test helpers.
  # See https://github.com/plataformatec/devise/issues/4191
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should get a list of rentals' do
    get rentals_url
    assert_response :success
  end

  test 'should rent a book' do
    assert_difference 'Rental.count' do
      post rental_create_url(books(:never_rented).id)
    end
    assert_difference 'Rental.count' do
      post rental_create_url(books(:returned).id)
    end
    assert_redirected_to books_url
  end

  test 'should return a book' do
    @rental = rentals(:started)
    post rental_finish_url(@rental.id)
    @rental.reload
    assert_equal Date.today, @rental.finish_date
  end

  test 'should not rent a book if it is already rented' do
    assert_raises(Pundit::NotAuthorizedError) do
      post rental_create_url(books(:rented).id)
    end
  end

  test 'should not return a book if the user is not the one who rented it' do
    sign_out @user
    sign_in users(:two)
    @rental = rentals(:started)
    assert_raises(Pundit::NotAuthorizedError) do
      post rental_finish_url(@rental.id)
    end
  end
end
