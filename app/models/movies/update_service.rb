module Movies
  class UpdateService

    def initialize movie
      @movie = movie
    end

    def update params
      unset_main_movie(params) && @movie.update(params)
    end

    private

      def unset_main_movie params
        if !@movie.main and params[:main]
          movie = Movie.where(locale: @movie.locale, main: true).first
          if movie && !movie.update_attribute(:main, false)
            return false
          end
        end
        return true
      end
  end
end