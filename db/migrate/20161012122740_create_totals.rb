class CreateTotals < ActiveRecord::Migration
  def change
    create_table :totals do |t|
      t.integer :recipe_id
      t.integer :value

      t.timestamps null: false
    end
  end
end
