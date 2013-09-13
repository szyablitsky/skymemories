module Movies
  class DestroyerService

    def initialize movie
      @movie = movie
    end

    def destroy
      @movie.destroy
      if @movie.main
        movies = Movie.where(locale: @movie.locale)
        movies.first.update_attribute(:main, true) if movies.count > 0
      end
    end

  end
end