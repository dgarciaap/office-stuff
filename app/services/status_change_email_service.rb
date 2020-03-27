class StatusChangeEmailService
  class << self
    def status_change_mail(email, item) 
      mail = UserMailer.with(email: email, item: item).status_change
      mail.deliver_later
    end
  end
end
