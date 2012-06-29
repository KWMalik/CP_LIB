class User < ActiveRecord::Base
  attr_accessible :name, :password
  has_secure_password

  before_save { |user| user.name = name.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  validates :password, length: { minimum: 6 }

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
