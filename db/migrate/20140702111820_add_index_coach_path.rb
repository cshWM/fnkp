class AddIndexCoachPath < ActiveRecord::Migration
  def up
    add_index(:coach_paths,[:coach_id, :coach_category_id],name: "coach_path_index")
  end

  def down
    remove_index( :coach_paths, name: "coach_path_index" )
  end

end
