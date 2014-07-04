class CreateRefereePaths < ActiveRecord::Migration
  def change
    create_table :referee_paths do |t|
      t.datetime :date_acomplished
      t.references :referee_category, index: true
      t.references :referee, index: true

      t.timestamps
    end
  end
end
