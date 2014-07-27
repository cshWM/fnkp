json.array!(@club_fee_issues) do |club_fee_issue|
  json.extract! club_fee_issue, :club_fee_id, :club_id, :value, :valid_year
  json.url club_fee_issue_url(club_fee_issue, format: :json)
end