class CreateCoachCategories < ActiveRecord::Migration
  def change
    create_table :coach_categories do |t|
      t.string :name
      t.integer :order
      t.boolean :active

      t.timestamps
    end
  end
end
