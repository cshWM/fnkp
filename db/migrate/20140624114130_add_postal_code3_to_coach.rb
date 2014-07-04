class AddPostalCode3ToCoach < ActiveRecord::Migration
  def change
    add_column :coaches, :postal_code3, :string
  end
end
