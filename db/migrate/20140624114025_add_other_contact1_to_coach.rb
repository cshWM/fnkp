class AddOtherContact1ToCoach < ActiveRecord::Migration
  def change
    add_column :coaches, :other_contact1, :string
  end
end
