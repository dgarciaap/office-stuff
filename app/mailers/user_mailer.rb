class UserMailer < ApplicationMailer
  default from: 'diana.garcia@tangosource.com'

  def item_creation
    @email = params[:email]
    @url = items_url
    mail(to: User.admin.pluck(:email), subject: 'An item has been posted')
  end

  def status_change
    @email = params[:email]
    @item = params[:item]
    @url = items_url + "/#{@item.id}"
    mail(to: @item.user.email, subject: 'Item status has changed')
  end

  def new_comment
    @email = params[:email]
    @item = params[:item]
    @url = items_url + "/#{@item.id}"
    mail(to: @item.user.email, subject: 'New comment on your post')
  end
end
