require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test 'login with invalid information' do
    get new_session_url
    assert_template 'sessions/new'
    post sessions_path, params: { session: { email: '', password: '' } }
    assert_template 'sessions/new'
  end

  test 'login with valid information' do
    get new_session_url
    assert_template 'sessions/new'
    post sessions_path, params: { session: { email: 'dg38828@gmail.com', password: '1234' } }
    assert_template 'items/show'
  end
end
