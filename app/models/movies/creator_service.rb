module Movies
  class CreatorService
    def initialize(movie)
      @movie = movie
    end

    def create
      @movie.main = no_movies_with_same_locale
      @movie.save
    end

    private

    def no_movies_with_same_locale
      Movie.where(locale: @movie.locale).count == 0
    end
  end
end
