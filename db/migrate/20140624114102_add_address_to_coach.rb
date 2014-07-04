class AddAddressToCoach < ActiveRecord::Migration
  def change
    add_column :coaches, :address, :string
  end
end
