class CreateAssociationFees < ActiveRecord::Migration
  def change
    create_table :association_fees do |t|
      t.string :name
      t.integer :valid_year
      t.boolean :is_total
      t.decimal :value
      t.boolean :valid

      t.timestamps
    end
  end
end
