class VimeoHelper

  def self.small_thumbnail(video_id)
    Vimeo::Simple::Video.info("#{video_id}").parsed_response[0]['thumbnail_small']
  end

end
