# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def item_creation_preview
    UserMailer.item_creation
  end

  def status_change_preview
    UserMailer.status_change
  end
end
