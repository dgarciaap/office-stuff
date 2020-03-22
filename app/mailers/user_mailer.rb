class UserMailer < ApplicationMailer
  default from: 'office_stuff@example.com'

  def item_creation(user)
    @user = user
    @url = 'http://localhost:3000/items'
    mail(to: User.admin.pluck(:email), subject: 'An item has been posted')
  end

  def status_change(user)
    @user = user
    @url = 'http://localhost:3000/items'
    mail(to: @user.email, subject: 'Item status has changed')
  end
end
