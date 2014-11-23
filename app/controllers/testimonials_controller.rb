class TestimonialsController < ApplicationController
  def index
    render :index, locals: { movies: movies }
  end

  def create
    testimonial = Testimonial.new(testimonial_params)
    render_js(testimonial, :create)
  end

  def update
    testimonial = testimonial_by_id
    testimonial.assign_attributes(testimonial_params)
    render_js(testimonial, :update)
  end

  def destroy
    testimonial_by_id.destroy
    render :destroy, locals: { movies: movies }
  end

  private

  def movies
    Testimonial.group_by_movie
  end

  def testimonial_by_id
    Testimonial.find(params[:id])
  end

  def render_js(testimonial, template)
    if testimonial.save
      render template, locals: { testimonial: testimonial, movies: movies }
    else
      render template, locals: { testimonial: testimonial }
    end
  end

  def testimonial_params
    params.require(:testimonial).permit(:movie_id, :body, :author)
  end
end