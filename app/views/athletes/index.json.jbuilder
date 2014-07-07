json.array!(@athletes) do |athlete|
  json.extract! athlete, :name, :short_name, :sex, :birthdate, :club_id, :active, :national, :is_current, :altered_by, :cc_code, :fnkp_code
  json.url athlete_url(athlete, format: :json)
end
