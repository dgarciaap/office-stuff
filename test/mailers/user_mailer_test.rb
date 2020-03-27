require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user = User.create(email: 'dg38828@gmail.com', password: '1223', role: 1)
    @item = Item.create(name: 'froggy chair', category: 'Stationary')
  end

  test 'jobs are being enqueued' do
    assert_equal 0, Sidekiq::Queues['default'].size
    Sidekiq::Client.push(
      'class' => 'UserMailer',
      'queue' => 'default',
      'args' => [1]
    )
    assert_equal 1, Sidekiq::Queues['default'].size
    assert_equal 'UserMailer', Sidekiq::Queues['default'].first['class']
    Sidekiq::Queues['default'].clear
  end

  test 'item_creation is sent' do
    email = UserMailer.with(user: @user).item_creation
    email.to = @user.email
    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['diana.garcia@tangosource.com'], email.from
    assert_equal [@user.email], email.to
    assert_equal 'An item has been posted', email.subject
  end

  test 'status_change is sent' do
    email = UserMailer.with(user: @user, item: @item).status_change
    email.to = @user.email
    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['diana.garcia@tangosource.com'], email.from
    assert_equal [@user.email], email.to
    assert_equal 'Item status has changed', email.subject
  end

  test 'new_comment is sent' do
    email = UserMailer.with(user: @user, item: @item).new_comment
    email.to = @user.email
    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['diana.garcia@tangosource.com'], email.from
    assert_equal [@user.email], email.to
    assert_equal 'New comment on your post', email.subject
  end
end
