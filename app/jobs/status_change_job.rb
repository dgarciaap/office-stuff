class StatusChangeJob < ApplicationJob
  queue_as :default

  def perform(email, item)
    StatusChangeEmailService.status_change_mail(email, item)
  end
end
