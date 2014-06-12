json.array!(@association_fee_issues) do |association_fee_issue|
  json.extract! association_fee_issue, :associationfee_id, :association_id, :value, :valid_year
  json.url association_fee_issue_url(association_fee_issue, format: :json)
end