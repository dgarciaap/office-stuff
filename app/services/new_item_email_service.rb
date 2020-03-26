class NewItemEmailService
  class << self
    def new_item_mail(email)
      mail = UserMailer.with(email: email).item_creation
      mail.deliver_later
    end
  end
end
