json.array!(@users) do |user|
  json.extract! user, :name, :email, :tipo
  json.url user_url(user, format: :json)
end