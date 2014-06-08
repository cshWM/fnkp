json.array!(@associations) do |association|
  json.extract! association, :name, :short_name, :address, :postal4, :postal3, :city, :phone, :email, :president, :url, :user_id
  json.url association_url(association, format: :json)
end