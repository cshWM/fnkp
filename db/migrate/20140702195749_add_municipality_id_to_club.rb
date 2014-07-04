class AddMunicipalityIdToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :municipality_id, :integer
    add_index :clubs, :municipality_id
  end
end
