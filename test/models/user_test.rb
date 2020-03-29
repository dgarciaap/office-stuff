require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: 'dg38828@gmail.com', password: '1234')
  end

  test 'valid user with arguments' do
    assert @user.valid?
  end

  test 'invalid user without arguments' do
    user = User.create
    assert_not user.valid?
  end

  test 'invalid user with empty strings' do
    @user.email = ''
    @user.password = ''
    assert_not @user.valid?
  end

  test 'invalid user with wrong email format' do
    @user.email = 'diana'
    assert_not @user.valid?
  end
end
