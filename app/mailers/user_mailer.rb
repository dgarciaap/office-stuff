class UserMailer < ApplicationMailer
  default from: 'diana.garcia@tangosource.com'

  def item_creation
    @email = params[:email]
    @url = 'http://localhost:3000/items'
    mail(subject: 'An item has been posted')
  end

  def status_change
    @email = params[:email]
    @item = params[:item]
    @url = "http://localhost:3000/items/#{@item.id}"
    mail(subject: 'Item status has changed')
  end

  def new_comment
    @email = params[:email]
    @item = params[:item]
    @url = "http://localhost:3000/items/#{@item.id}"
    mail(subject: 'New comment on your post')
  end
end
