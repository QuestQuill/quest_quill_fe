class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP}
  validates :password, presence: true

  has_secure_password
end
