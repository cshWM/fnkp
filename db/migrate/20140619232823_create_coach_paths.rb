class CreateCoachPaths < ActiveRecord::Migration
  def change
    create_table :coach_paths do |t|
      t.datetime :date_acomplished
#      t.references :coach_category, index: true
#      t.references :coach, index: true
      t.belongs_to :coaches
      t.belongs_to :coach_categories

      t.timestamps
    end
  end
end
