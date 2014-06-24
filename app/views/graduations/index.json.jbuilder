json.array!(@graduations) do |graduation|
  json.extract! graduation, :name, :order, :price, :active
  json.url graduation_url(graduation, format: :json)
end