FactoryGirl.define do
  factory :movie do
    sequence (:vimeo_id) { |i| 100000000 + i }
    locale 'ru'
    main true#, false
	
    factory :movie_en do
      locale 'en'
    end

    factory :movie_hb do
      locale 'hb'
    end

  end
end