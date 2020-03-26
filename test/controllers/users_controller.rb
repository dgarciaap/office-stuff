require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup 
    @user = User.new(email: 'diana@gmail.com', password: '1234')
  end

  test 'should get sign up' do
    get new_user_url
    assert_response :success
  end

  test 'valid signup' do
    get new_user_url
    assert_response :success

    post users_path, params: { user: { email: @user.email, password: @user.password } }
    follow_redirect!
    assert_response :success
  end

  test 'invalid signup' do
    get new_user_url
    assert_response :success

    post users_path, params: { user: { email: '', password: '' } }
    assert_template :new
  end
end
