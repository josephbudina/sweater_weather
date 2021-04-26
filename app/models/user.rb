class User < ApplicationRecord
  validates :password, confirmation: { case_sensitive: true }
end