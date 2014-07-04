class AddNotesToCoach < ActiveRecord::Migration
  def change
    add_column :coaches, :notes, :string
  end
end
