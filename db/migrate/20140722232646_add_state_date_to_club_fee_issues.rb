class AddStateDateToClubFeeIssues < ActiveRecord::Migration
  def change
    add_column :club_fee_issues, :state_date, :date
  end
end
