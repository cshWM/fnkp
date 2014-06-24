json.array!(@coach_paths) do |coach_path|
  json.extract! coach_path, :date_acomplished, :coach_category_id, :coach_id
  json.url coach_path_url(coach_path, format: :json)
end