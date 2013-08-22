module MoviesHelper

  def sort_and_add_locales(locales)
    LOCALE_NAMES.map { |m| l = m[0]; [l, locales[l]] }
  end

  def movie_class_for(movie)
    if movie.main
      "movie movie-main"
    else
      "movie"
    end
  end

  def main_form_for(movie)
    if !movie.main
      movie.main = true
      render "main_form", movie: movie
    end
  end

  def thumbnail_for(movie)
    url = movie.main ? movie.thumbnail.gsub('_100.','_200.') : movie.thumbnail
    image_tag url
  end

end
