class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.string :name
      t.string :short_name
      t.string :address
      t.string :postal4
      t.string :postal3
      t.string :city
      t.string :phone
      t.string :email
      t.string :president
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
