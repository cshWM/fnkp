json.array!(@referee_categories) do |referee_category|
  json.extract! referee_category, :name, :order, :active
  json.url referee_category_url(referee_category, format: :json)
end