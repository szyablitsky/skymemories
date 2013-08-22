module MoviesHelper

  # Movie model

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

  # Vimeo videos

  def vimeo_info_for(movie)
    video = Vimeo::Simple::Video.info("#{movie.vimeo_id}").parsed_response[0]
    video_thumbnail_url = video[movie.main ? 'thumbnail_medium' : 'thumbnail_small']
    raw "#{image_tag video_thumbnail_url} <p>#{video['title']}</p>"
  end

  def title_for(video)
    truncate video['title'], length: 40
  end

end
