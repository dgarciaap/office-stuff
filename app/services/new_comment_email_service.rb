class NewCommentEmailService
  class << self
    def new_comment_mail(email, item)
      mail = UserMailer.with(email: email, item: item).new_comment
      mail.deliver_later
    end
  end
end
