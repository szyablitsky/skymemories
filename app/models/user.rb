class User < ActiveRecord::Base

  before_save { self.email = email.downcase }

  has_many :posts

  validates :name, presence: true
  validates :name, length: { maximum: 50 }

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: /.+@.+\..+/

end
