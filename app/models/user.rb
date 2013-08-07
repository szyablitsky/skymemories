class User < ActiveRecord::Base

  before_save { email.downcase! }

  has_many :posts

  has_secure_password
  validates :password, length: { minimum: 6 }

  validates :name, presence: true
  validates :name, length: { maximum: 50 }

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: /.+@.+\..+/


end
