FactoryGirl.define do
  factory :movie do
    sequence (:vimeo_id) { |i| 222111000 + i }
    locale 'ru'
    main true#, false
    sequence (:title) { |i| 'Title' + i }
	
    factory :movie_en do
      locale 'en'
    end

    factory :movie_hb do
      locale 'hb'
    end

  end
end