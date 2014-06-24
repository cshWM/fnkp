json.array!(@coaches) do |coach|
  json.extract! coach, :fnkp_code, :ipdj_code, :official_name, :import_code, :cc_code, :birthdate, :valid
  json.url coach_url(coach, format: :json)
end