class AddAlteredByToCoach < ActiveRecord::Migration
  def change
    add_column :coaches, :altered_by, :integer
  end
end
