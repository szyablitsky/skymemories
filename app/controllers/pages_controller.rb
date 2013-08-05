class PagesController < ApplicationController

  def home
    @main_movie = Movie.main
    @other_movies = Movie.other
  end

  def contact
  end
  
end
