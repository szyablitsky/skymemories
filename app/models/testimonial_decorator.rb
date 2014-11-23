class TestimonialDecorator < SimpleDelegator
  def formatted_body
    sanitize(body).gsub("\n",'<br />').html_safe
  end

  private

  def sanitize(string)
     ActionController::Base.helpers.sanitize(string)
  end
end