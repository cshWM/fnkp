class AddAlteredByToCoachPath < ActiveRecord::Migration
  def change
    add_column :coach_paths, :altered_by, :integer
  end
end
