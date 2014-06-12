json.array!(@orders) do |order|
  json.extract! order, :name, :total_value, :state, :state_date, :has_many
  json.url order_url(order, format: :json)
end