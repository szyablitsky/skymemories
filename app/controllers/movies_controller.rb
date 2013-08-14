require 'vimeo_helper'

class MoviesController < ApplicationController

  before_action :set_movie, only: [:edit, :update, :destroy]

  def index
    @locale_groups = Movie.group_by_locale
  end

  def new
    @videos = VimeoHelper.videos
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, success: 'Movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movies_path, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
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
