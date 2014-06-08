json.array!(@clubs) do |club|
  json.extract! club, :name, :short_name, :address, :postal4, :postal3, :city, :phone, :email, :president, :url, :user_id, :association_id
  json.url club_url(club, format: :json)
end