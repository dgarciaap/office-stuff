class NewCommentEmailService
  class << self
    def new_comment_mail(email, item)
      mail = UserMailer.with(email: email, item: item).new_comment
      mail.to = email
      mail.deliver_now
    end
  end
end
