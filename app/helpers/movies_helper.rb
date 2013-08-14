module MoviesHelper

  LOCALE_NAMES = { ru: 'Русский', en: 'English', he: 'עִבְרִית' }

  # Movie model

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

  # Vimeo videos

  def title_for(video)
    truncate video['title'], length: 40
  end

end
