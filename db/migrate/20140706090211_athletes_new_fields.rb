class AthletesNewFields < ActiveRecord::Migration
  def change
    change_table :athletes do |t|
      t.boolean :active, :national, :is_current
      t.integer :altered_by
      t.string :cc_code
      t.rename :externalCode, :import_code
    end
  end
end
