class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.decimal :total_value
      t.string :state, index:true
      t.datetime :state_date

      t.timestamps
    end
  end
end
