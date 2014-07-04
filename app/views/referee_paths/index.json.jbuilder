json.array!(@referee_paths) do |referee_path|
  json.extract! referee_path, :date_acomplished, :referee_category_id, :referee_id
  json.url referee_path_url(referee_path, format: :json)
end