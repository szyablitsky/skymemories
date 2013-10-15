class Movie < ActiveRecord::Base

  validates :vimeo_id, presence: true
  validates :vimeo_id, numericality: true
  validates :vimeo_id, uniqueness: true

  validates :locale, presence: true
  validates :locale, inclusion: { in: LOCALES, message: 'не входит в список языков' }

  def self.group_by_locale
    self.all.order('main desc').group_by(&:locale)
  end

  scope :by_locale, -> (locale) { where(locale: locale).order('main desc') }

end