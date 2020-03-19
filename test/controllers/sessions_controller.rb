require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get login' do
    get new_session_url
    assert_response :success
  end
end
