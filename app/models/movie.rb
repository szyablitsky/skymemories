class Movie < ActiveRecord::Base
  validates_presence_of :vimeo_id, :locale
  validates_inclusion_of :locale, in: %w( en ru hb ), message: 'не входит в список языков'
end
