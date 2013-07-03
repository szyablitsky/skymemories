json.array!(@movies) do |movie|
  json.extract! movie, :vimeo_id, :locale, :main
  json.url movie_url(movie, format: :json)
end
