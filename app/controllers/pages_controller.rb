class PagesController < ApplicationController

  def home
    @movies = Movie.by_locale(I18n.locale.to_s)
    default_movie_attrs = { vimeo_id: 76028042, title: 'Misha+Dasha(the highlights)',
      thumbnail: 'http://b.vimeocdn.com/ts/450/734/450734986_100.jpg' }
    @movies = [Movie.new(default_movie_attrs)] if @movies.empty?
  end

  def about
  end

  def contact
  end
  
end
