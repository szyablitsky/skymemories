module PagesHelper

  def slider_content_for movies
    count = -1
    raw movies.map { |movie|
      count += 1 
      render 'pages/movie', count: count, id: movie.vimeo_id
    }.join
  end

end
