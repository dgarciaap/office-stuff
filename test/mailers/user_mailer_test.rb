require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user = User.create(email: 'dg38828@gmail.com', password: '1223', role: 1)
    @item = Item.create(name: 'froggy chair', category: 'Stationary')
  end

  test 'item_creation' do
    email = UserMailer.item_creation(@user).deliver

    assert_emails 1 do
      email.deliver
    end

    assert_equal ['diana.garcia@tangosource.com'], email.from
    assert_equal User.admin.pluck(:email), email.to
    assert_equal 'An item has been posted', email.subject
  end

  test 'status change' do
    email = UserMailer.status_change(@user).deliver

    assert_emails 1 do
      email.deliver
    end

    assert_equal ['diana.garcia@tangosource.com'], email.from
    assert_equal [@user.email], email.to
    assert_equal 'Item status has changed', email.subject
  end

  test 'new comment in a certain item' do
    email = UserMailer.new_comment(@user, @item).deliver

    assert_emails 1 do
      email.deliver
    end

    assert_equal ['diana.garcia@tangosource.com'], email.from
    assert_equal [@user.email], email.to
    assert_equal 'New comment on your post', email.subject
  end
end
