json.array!(@club_fees) do |club_fee|
  json.extract! club_fee, :name, :valid_year, :value, :active
  json.url club_fee_url(club_fee, format: :json)
end