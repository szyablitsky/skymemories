class Post < ActiveRecord::Base
  self.per_page = 5

  default_scope -> { order('created_at DESC') }

  belongs_to :user
  validates :user_id, presence: true

  validates :title, presence: true

  validates :content, presence: true
end
