class AddMobileToCoach < ActiveRecord::Migration
  def change
    add_column :coaches, :mobile, :string
  end
end
