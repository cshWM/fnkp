json.array!(@districts) do |district|
  json.extract! district, :name, :active, :region_id
  json.url district_url(district, format: :json)
end