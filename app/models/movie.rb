class Movie < ActiveRecord::Base

  before_create :set_main

  validates :vimeo_id, presence: true
  validates :vimeo_id, numericality: true
  validates :vimeo_id, uniqueness: true

  validates :locale, presence: true
  validates :locale, inclusion: { in: LOCALES, message: 'не входит в список языков' }

  def Movie.group_by_locale
    Movie.all.order('main desc').group_by(&:locale)
  end

  alias _update update

  def update(params)
    if !self.main and params[:main]
      movie = Movie.where(locale: self.locale, main: true).first
      return false unless movie.update_attribute(:main, false)
    end
    self._update(params)
  end

  alias _destroy destroy

  def destroy
    if self.main and Movie.where(locale: self.locale).count > 1
      return false unless Movie.where(locale: self.locale).first.update_attribute(:main, true)
    end
    self._destroy
  end

  private

    def set_main
      self.main = (Movie.where(locale: self.locale).count == 0)
      return true
    end

end