class User < ActiveRecord::Base
  has_many :posts
  validates :name,  presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 8 }, on: create
  before_create :create_remember_token

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
