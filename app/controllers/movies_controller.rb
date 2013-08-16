require 'vimeo_helper'

class MoviesController < ApplicationController

  before_action :set_movie, only: [:edit, :update, :destroy]

  def index
    @locales = Movie.group_by_locale
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, success: 'Movie was successfully created.'
    else
      redirect_to movies_path, error: 'Problems.'
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path, success: 'Movie was successfully updated.'
    else
      redirect_to movies_path, error: 'Problems.'
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:vimeo_id, :locale, :main)
    end
end
