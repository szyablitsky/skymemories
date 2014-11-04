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
    @movie = Movie.new(movie_params)

    if Movies::CreatorService.new(@movie).create #@movie.save
      redirect_to movies_path, flash: {success: 'Фильм успешно добавлен'}
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if Movies::UpdateService.new(@movie).update(movie_params)
      redirect_to movies_path, flash: {success: 'Изменения успешно сохранены.'}
    else
      render action: 'edit'
    end
  end

  def destroy
    Movies::DestroyerService.new(@movie).destroy #@movie.destroy
    redirect_to movies_url
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:vimeo_id, :locale, :main, :title, :description, :thumbnail)
    end
end
