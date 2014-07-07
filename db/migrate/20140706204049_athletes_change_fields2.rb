class AthletesChangeFields2 < ActiveRecord::Migration
  def up
    change_table :athletes do |t|
      t.change :fnkp_code, :integer
    end
  end

  def down
    change_table :athletes do |t|
      t.change :fnkp_code, :string
    end
  end
end
