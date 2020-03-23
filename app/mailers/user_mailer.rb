class UserMailer < ApplicationMailer
  default from: 'diana.garcia@tangosource.com'

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

  def new_comment(user, item)
    @user = user
    @item = item
    @url = "http://localhost:3000/items/#{item.id}"
    mail(to: @user.email, subject: 'New comment on your post')
  end
end
