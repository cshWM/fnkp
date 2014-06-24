json.array!(@coach_categories) do |coach_category|
  json.extract! coach_category, :name, :order, :valid
  json.url coach_category_url(coach_category, format: :json)
end