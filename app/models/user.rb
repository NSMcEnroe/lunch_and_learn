class User < ApplicationRecord
  before_create :generate_api_key

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  private 

  def generate_api_key
    self.api_key = SecureRandom.hex(12)
  end
end
