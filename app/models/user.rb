class User < ActiveRecord::Base

  self.per_page = 10

  before_save { email.downcase! }
  before_create :create_remember_token

  has_many :posts

  has_secure_password
  validates :password, length: { minimum: 6 }

  validates :name, presence: true
  validates :name, length: { maximum: 50 }

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: /.+@.+\..+/

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
