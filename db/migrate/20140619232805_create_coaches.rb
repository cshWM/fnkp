class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :fnkp_code
      t.string :ipdj_code
      t.string :official_name
      t.string :import_code
      t.string :cc_code
      t.date :birthdate
      t.boolean :active
#      t.has_many :coach_paths
#      t.has_many :coach_categories, through :coach_paths

      t.timestamps
    end
  end
end
