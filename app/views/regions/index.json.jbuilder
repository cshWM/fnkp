json.array!(@regions) do |region|
  json.extract! region, :name, :order, :active
  json.url region_url(region, format: :json)
end