class FixCoachPaths < ActiveRecord::Migration
  def change
    change_table :coach_paths do |t|
      t.belongs_to :coach
      t.belongs_to :coach_category
    end
  end
end
