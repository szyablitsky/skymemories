module MoviesHelper

  LOCALE_NAMES = { ru: 'Русский', en: 'English', he: 'עִבְרִית' }

  def movie_class(movie)
    if movie.main
      "movie movie-main"
    else
      "movie"
    end
  end

  def locale_for(movie)
    content_tag :h1, LOCALE_NAMES[movie.locale.to_sym] if movie.main
  end

end
