class CreateClubFees < ActiveRecord::Migration
  def change
    create_table :club_fees do |t|
      t.string :name
      t.integer :valid_year
      t.decimal :value
      t.boolean :active

      t.timestamps
    end
  end
end
