class PagesController < ApplicationController

  def home
    @movies = Movie.by_locale(I18n.locale.to_s)
    @movies = [Movie.new(vimeo_id: 76028042)] if @movies.empty?
  end

  def about
  end

  def contact
  end
  
end
