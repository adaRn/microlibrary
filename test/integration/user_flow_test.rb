require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'can see one link to Google login if not logged in' do
    get '/'
    assert_select 'a[href=?]', '/users/auth/google_oauth2', count: 1
  end

  test 'cannot see the link to Google login if logged in' do
    sign_in create(:user)
    get '/'
    assert_select 'a[href=?]', '/users/auth/google_oauth2', count: 0
  end

  test 'can see two logouts link if signed in on the home page' do
    sign_in create(:user)
    get '/'
    assert_select 'a[href=?]', '/sign_out', count: 2
  end

  test 'cannot see a logout link if not signed in' do
    get '/'
    assert_select 'a[href=?]', '/sign_out', count: 0
  end

  test 'cannot see books if not logged in' do
    get '/books'
    assert_redirected_to '/sign_in'
  end
end
