json.array!(@municipalities) do |municipality|
  json.extract! municipality, :name, :district_id, :active
  json.url municipality_url(municipality, format: :json)
end