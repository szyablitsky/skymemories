module MoviesHelper
  def sort_and_add_locales(locales)
    LOCALE_NAMES.map { |m| l = m[0]; [l, locales[l]] }
  end

  def locale_name(locale)
    LOCALE_NAMES[locale]
  end

  def thumbnail_for(movie)
    url = movie.main ? movie.thumbnail.gsub('_100.', '_200.') : movie.thumbnail
    image_tag url
  end
end
