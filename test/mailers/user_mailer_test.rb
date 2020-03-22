require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user = User.create(email: 'dg38828@gmail.com', password: '1223')
  end

  test 'item_creation' do
    email = UserMailer.item_creation(@user).deliver

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['office_stuff@example.com'], email.from
    assert_equal [@user.email], email.to
    assert_equal 'An item has been posted', email.subject
  end

  test 'status change' do
    email = UserMailer.status_change(@user).deliver

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['office_stuff@example.com'], email.from
    assert_equal [@user.email], email.to
    assert_equal 'Item status has changed', email.subject
  end
end
