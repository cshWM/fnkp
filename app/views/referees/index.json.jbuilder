json.array!(@referees) do |referee|
  json.extract! referee, :fnkp_code, :official_name, :import_code, :cc_code, :birthdate, :email, :mobile, :other_contact1, :other_contact2, :address, :postal_code4, :postal_code3, :municipality_id, :notes, :altered_by, :active
  json.url referee_url(referee, format: :json)
end