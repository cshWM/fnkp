class CreateReferees < ActiveRecord::Migration
  def change
    create_table :referees do |t|
      t.string :fnkp_code
      t.string :official_name
      t.string :import_code
      t.string :cc_code
      t.date :birthdate
      t.string :email
      t.string :mobile
      t.string :other_contact1
      t.string :other_contact2
      t.string :address
      t.string :postal_code4
      t.string :postal_code3
      t.belongs_to :municipality, index: true
      t.string :notes
      t.integer :altered_by
      t.boolean :active

      t.timestamps
    end
  end
end
