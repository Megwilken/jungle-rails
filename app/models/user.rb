class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email_address, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, on: :create
end
