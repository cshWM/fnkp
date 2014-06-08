json.array!(@athletes) do |athlete|
  json.extract! athlete, :name, :short_name, :sex, :birthdate, :externalCode, :club_id
  json.url athlete_url(athlete, format: :json)
end