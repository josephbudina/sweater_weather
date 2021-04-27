class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, on: :create, presence: true
  validates_presence_of :password, require: true
  validates :password, confirmation: { case_sensitive: true }
end