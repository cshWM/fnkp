json.array!(@association_fees) do |association_fee|
  json.extract! association_fee, :name, :valid_year, :is_total, :value, :active
  json.url association_fee_url(association_fee, format: :json)
end
