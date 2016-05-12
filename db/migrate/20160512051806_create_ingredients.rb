class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :price
      t.string :name
      t.string :quantity
      t.integer :recipe_id
      t.string :unit

      t.timestamps null: false
    end
  end
end
