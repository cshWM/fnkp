class AddStateToClubFeeIssues < ActiveRecord::Migration
  def change
    add_column :club_fee_issues, :state, :string
  end
end
