class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.boolean :active
      t.belongs_to :region, index: true

      t.timestamps
    end
  end
end
