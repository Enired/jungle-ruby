class User < ApplicationRecord
  has_secure_password

  validates :first_name, prescence: true
  validates :last_name, prescence: true
  validates :email, prescence: true
end
