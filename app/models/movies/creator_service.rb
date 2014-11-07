module Movies
  class CreatorService
    def initialize(params)
      @movie = Movie.new(params)
    end

    def create
      @movie.index = -1
      @movie.save && reorder
    end

    private

    def reorder
      Movie.by_locale(@movie.locale).each_with_index do |movie, index|
        movie.update_column(:index, index)
      end
    end
  end
end
