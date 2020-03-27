require 'test_helper'

class NewCommentJobTest < ActiveJob::TestCase
  include ActionMailer::TestHelper

  def setup
    @user = User.create(email: 'dg@gmail.com', password: '1234')
    @item = Item.create(name: 'frog', category: 'Stationary')
  end

  test 'job is performed' do
    assert_emails 1 do
      NewCommentJob.perform_now(@user.email, @item)
    end
  end
end
