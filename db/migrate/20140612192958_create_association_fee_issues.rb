class CreateAssociationFeeIssues < ActiveRecord::Migration
  def change
    create_table :association_fee_issues do |t|
      t.belongs_to :associationfee, index: true
      t.belongs_to :association, index: true
      t.decimal :value
      t.integer :valid_year

      t.timestamps
    end
  end
end
