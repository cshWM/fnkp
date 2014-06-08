class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :short_name
      t.string :sex
      t.date :birthdate
      t.string :externalCode
      t.integer :club_id

      t.timestamps
    end
  end
end
