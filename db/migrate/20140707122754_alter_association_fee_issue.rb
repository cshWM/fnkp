class AlterAssociationFeeIssue < ActiveRecord::Migration
  def up
    change_table :association_fee_issues do |t|
      t.rename :associationfee_id, :association_fee_id
    end
  end

  def down
    change_table :association_fee_issues do |t|
      t.rename :association_fee_id, :associationfee_id
    end
  end
end
