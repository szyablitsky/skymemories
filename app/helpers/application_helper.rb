module ApplicationHelper

  # Returns the full title on a per-page basis.
  def title(page_title)
    base_title = "Sky Memories"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  #gravatar
  def gravatar_for(user, options={})
    options['alt'] ||= user.name
    options['class'] ||= 'gravatar'
    gravatar_image_tag(user.email, options)
  end

end
