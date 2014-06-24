class CreateGraduations < ActiveRecord::Migration
  def change
    create_table :graduations do |t|
      t.string :name
      t.integer :order
      t.integer :price
      t.boolean :active

      t.timestamps
    end
  end
end
