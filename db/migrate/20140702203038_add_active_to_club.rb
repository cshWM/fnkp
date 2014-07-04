class AddActiveToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :active, :boolean
  end
end
