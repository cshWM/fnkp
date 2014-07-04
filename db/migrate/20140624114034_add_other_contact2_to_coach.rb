class AddOtherContact2ToCoach < ActiveRecord::Migration
  def change
    add_column :coaches, :other_contact2, :string
  end
end
