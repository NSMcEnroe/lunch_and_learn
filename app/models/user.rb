class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :api_key, presence: true, uniqueness: true

  has_secure_password

  before_create :generate_api_key

  private 

  def generate_api_key
    self.api_key = SecureRandom.hex(12)
  end
end
