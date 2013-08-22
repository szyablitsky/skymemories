FactoryGirl.define do
  factory :movie do
    sequence (:vimeo_id) { |i| 222111000 + i }
    locale 'ru'
    sequence (:main) { |i| i == 1 }
    sequence (:title) { |i| "Title#{i}" }
    thumbnail 'http://cdn.vimeo.com/1.jpg'
	
    factory :movie_en do
      locale 'en'
    end

    factory :movie_hb do
      locale 'hb'
    end

  end
end