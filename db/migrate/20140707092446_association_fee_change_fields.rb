class AssociationFeeChangeFields < ActiveRecord::Migration
  def up
    change_table :association_fees do |t|
      t.rename :valid, :active
    end
  end

  def down
    change_table :association_fees do |t|
      t.rename :active, :valid
    end
  end
end
