require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'can see the link to Google login' do
    get '/'
    assert_select 'a', href: '/users/auth/google_oauth2'
  end

  test 'cannot see the link to Google login if logged in' do
    sign_in User.create(name: 'John Doe', provider: 'google_oauth2', uid: '123')
    get '/'
    assert_select 'a', href: '/users/auth/google_oauth2', count: 0
  end
end
