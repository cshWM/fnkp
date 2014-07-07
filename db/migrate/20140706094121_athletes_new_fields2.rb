class AthletesNewFields2 < ActiveRecord::Migration
  def change
    change_table :athletes do |t|
      t.string :fnkp_code
    end
  end
end
