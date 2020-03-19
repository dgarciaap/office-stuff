require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get sign up' do
    get new_user_url
    assert_response :success
  end
end
