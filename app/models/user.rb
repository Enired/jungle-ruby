class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 4}
  validates :password_confirmation, presence: true

  def authenticate_with_credentials(email_input, password_input)
    user = User.find_by_email(email_input)
    user && user.authenticate(password_input) ? user : nil
  end
end