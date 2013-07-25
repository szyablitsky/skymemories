class SiteController < ApplicationController

  def home
    @main_movie = Movie.main
    @other_movies = Movie.other
  end

end
