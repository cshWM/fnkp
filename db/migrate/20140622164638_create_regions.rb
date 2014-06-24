class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.integer :order
      t.boolean :active

      t.timestamps
    end
  end
end
