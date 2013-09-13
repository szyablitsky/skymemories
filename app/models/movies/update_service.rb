module Movies
  class UpdateService

    def initialize movie
      @movie = movie
    end

    def update params
      if !@movie.main and params[:main]
        movie = Movie.where(locale: @movie.locale, main: true).first
        return false unless movie.update_attribute(:main, false)
      end
      @movie.update(params)
    end

  end
end