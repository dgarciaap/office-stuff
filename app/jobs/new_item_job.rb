class NewItemJob < ApplicationJob
  queue_as :default

  def perform(email)
    NewItemEmailService.new_item_mail(email)
  end
end
