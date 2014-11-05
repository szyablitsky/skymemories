class Movie < ActiveRecord::Base
  validates :vimeo_id, presence: true
  validates :vimeo_id, numericality: true
  validates :vimeo_id, uniqueness: true

  validates :title, presence: true

  validates :locale, presence: true
  validates :locale, inclusion:
    { in: LOCALES, message: 'не входит в список языков' }

  def self.column(n, columns = 3)
    movies = where(main: false).order('updated_at desc').by_current_locale.to_a
    n.step(movies.size - 1, columns).map { |i| movies[i] }
  end

  def self.group_by_locale
    order('main desc').group_by(&:locale)
  end

  scope :main, -> { where(main: true).by_current_locale.first }

  scope :by_current_locale, -> { where(locale: I18n.locale.to_s) }

  def thumbnail_id
    thumbnail.scan(/\/(\d+)_/).last.first
  end
end
