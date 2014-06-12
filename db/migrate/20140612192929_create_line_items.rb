class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :name
      t.decimal :value
      t.string :state
      t.datetime :state_date
      t.belongs_to :order, index: true

      t.timestamps
    end
  end
end
