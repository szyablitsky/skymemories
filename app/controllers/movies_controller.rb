class MoviesController < ApplicationController
  before_action :signed_in_user
  before_action :set_movie, only: [:edit, :update, :destroy]

  def index
    @locales = Movie.group_by_locale
  end

  def new
    @movie = Movie.new(locale: LocalesService.get_locale_from(params))
  end

  def create
    @movie = Movie.new()
    if Movies::CreatorService.new(movie_params).create
      redirect_to movies_path, flash: {success: 'Фильм успешно добавлен'}
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path, flash: {success: 'Изменения успешно сохранены.'}
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url
  end

  def order
    Movies::OrderService.new(params[:order]).perform
    head :no_content
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:vimeo_id, :locale, :main, :title, :description, :thumbnail)
  end
end
