class User < ApplicationRecord
  has_secure_password
  has_many :lists, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
