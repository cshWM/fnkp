class CreateClubFeeIssues < ActiveRecord::Migration
  def change
    create_table :club_fee_issues do |t|
      t.belongs_to :club_fee, index: true
      t.belongs_to :club, index: true
      t.decimal :value
      t.integer :valid_year

      t.timestamps
    end
  end
end
