class Testimonial < ActiveRecord::Base
  belongs_to :movie

  validates :body, presence: true
  validates :author, presence: true

  def self.group_by_movie
    includes(:movie).group_by { |t| t.movie.title }.sort
  end
end
