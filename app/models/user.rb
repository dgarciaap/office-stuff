class User < ApplicationRecord
  validates :email,format:{with: URI::MailTo::EMAIL_REGEXP}, presence: true
  validates :password, presence: true

  enum role: {common: 0, admin: 1}
end
