class AddPostalCode4ToCoach < ActiveRecord::Migration
  def change
    add_column :coaches, :postal_code4, :string
  end
end
