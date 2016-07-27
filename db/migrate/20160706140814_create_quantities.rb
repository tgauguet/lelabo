class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.decimal :quantity

      t.timestamps null: false
    end
  end
end
