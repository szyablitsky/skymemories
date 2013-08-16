class VimeoHelper

  def self.thumbnail_small(video_id)
    Vimeo::Simple::Video.info("#{video_id}").parsed_response[0]['thumbnail_small']
  end

  def self.videos
    Vimeo::Simple::User.videos('skymemories').parsed_response + \
    Vimeo::Simple::User.videos('skymemories', 2).parsed_response + \
    Vimeo::Simple::User.videos('skymemories', 3).parsed_response
  end

end
