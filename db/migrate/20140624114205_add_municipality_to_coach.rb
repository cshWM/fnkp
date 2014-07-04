class AddMunicipalityToCoach < ActiveRecord::Migration
  def change
    add_reference :coaches, :municipality, index: true
  end
end
