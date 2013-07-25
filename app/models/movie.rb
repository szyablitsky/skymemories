class Movie < ActiveRecord::Base

  validates :vimeo_id, { presence: true,
  	 					 numericality: true,
  	 					 uniqueness: true
   					   }

  validates :locale,   { presence: true,
                         inclusion: { in: %w( en ru hb ),
                                      message: 'не входит в список языков'
                                    }
                       }

end
