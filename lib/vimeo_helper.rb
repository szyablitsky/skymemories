class VimeoHelper

  def self.videos
    Vimeo::Simple::User.all_videos("skymemories")
  end

end
