class CreateMunicipalities < ActiveRecord::Migration
  def change
    create_table :municipalities do |t|
      t.string :name
      t.belongs_to :district, index: true
      t.boolean :active

      t.timestamps
    end
  end
end
