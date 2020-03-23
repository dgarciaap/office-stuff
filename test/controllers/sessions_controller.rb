require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup 
    @user = User.new(email: 'diana@gmail.com', password: '1234')
  end

  test 'should get login' do
    get new_session_url
    assert_response :success
  end

  test 'valid login' do
    get new_session_url
    assert_response :success

    post sessions_path, params: { session: { email: @user.email, password: @user.password } }
    assert_response :success
  end

  test 'invalid login' do
    get new_session_url
    assert_response :success

    post sessions_path, params: { session: { email: '', password: '' } }
    assert_template 'sessions/new'
  end

  test 'user logs out' do
    get '/logout'
    assert_response 302, status
  end
end
