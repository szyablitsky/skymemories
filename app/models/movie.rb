class Movie < ActiveRecord::Base
  validates_presence_of :vimeo_id, :locale, :main
end
