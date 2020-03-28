require 'test_helper'

class NewItemJobTest < ActiveJob::TestCase
  include ActionMailer::TestHelper

  def setup
    @user = User.create(email: 'dg38828@gmail.com', password: '1234', role: 1)
  end

  test 'job is performed' do
    assert_emails 1 do
      NewItemJob.perform_now(@user.email)
    end
  end
end
