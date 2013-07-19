json.array!(@users) do |user|
  json.extract! user, :name, :login, :email
  json.url user_url(user, format: :json)
end
