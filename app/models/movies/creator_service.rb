module Movies
  class CreatorService

    def initialize movie
      @movie = movie
    end

    def create
      @movie.main = (Movie.where(locale: @movie.locale).count == 0)
      @movie.save
    end

  end
end