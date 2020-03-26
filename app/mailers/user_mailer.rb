class UserMailer < ApplicationMailer
  default from: 'diana.garcia@tangosource.com'

  def item_creation
    @email = params[:email]
    @url = 'http://localhost:3000/items'
    mail(to: User.admin.pluck(:email), subject: 'An item has been posted')
  end

  def status_change
    @email = params[:email]
    @item = params[:item]
    @url = "http://localhost:3000/items/#{@item.id}"
    mail(to: @email, subject: 'Item status has changed')
  end

  def new_comment
    @email = params[:email]
    @item = params[:item]
    @url = "http://localhost:3000/items/#{@item.id}"
    mail(to: @email, subject: 'New comment on your post')
  end
end
