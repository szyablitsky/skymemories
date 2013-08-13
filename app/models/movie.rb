class Movie < ActiveRecord::Base

  validates :vimeo_id, presence: true
  validates :vimeo_id, numericality: true
  validates :vimeo_id, uniqueness: true

  validates :locale, presence: true
  validates :locale, inclusion: { in: LOCALES, message: 'не входит в список языков' }

  scope :main, lambda { where('main=?',true) }
  scope :other, lambda { where('main<>?',true) }

  def Movie.group_by_locale
    Movie.all.group_by(&:locale)
  end

end