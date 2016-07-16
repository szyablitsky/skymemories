# frozen_string_literal: true

class PagesController < ApplicationController
  DEFAULT_MOVIE_ATTRS = {
    vimeo_id: 76_028_042,
    title: 'Misha+Dasha(the highlights)',
    thumbnail: 'http://b.vimeocdn.com/ts/450/734/450734986_100.jpg',
    testimonials: [],
  }.freeze

  def home
    @main_movie = Movie.main
    @main_movie = Movie.new(DEFAULT_MOVIE_ATTRS) unless @main_movie
    @movies = (0..2).map { |i| Movie.column(i) }
  end

  def about
  end

  def vacancies
  end
end
