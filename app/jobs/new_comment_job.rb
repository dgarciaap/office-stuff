class NewCommentJob < ApplicationJob
  queue_as :default

  def perform(email, item)
    NewCommentEmailService.new_comment_mail(email, item)
  end
end
