class NewItemEmailService
  class << self
    def new_item_mail(email)
      mail = UserMailer.with(email: email).item_creation
      mail.to = User.admin.pluck(:email)
      mail.deliver_now
    end
  end
end
