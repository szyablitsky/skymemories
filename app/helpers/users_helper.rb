module UsersHelper

  def gravatar_for(user, options={})
    options['alt'] ||= user.name
    options['class'] ||= 'gravatar'
    gravatar_image_tag(user.email, options)
  end

end
