module Movies
  class UpdateService

    def initialize movie
      @movie = movie
    end

    def update params
      unset_main_movie && @movie.update(params)
    end

    private

      def unset_main_movie params
        if !@movie.main and params[:main]
          movie = Movie.where(locale: @movie.locale, main: true).first
          return false unless movie.update_attribute(:main, false)
        end
      end
  end
end