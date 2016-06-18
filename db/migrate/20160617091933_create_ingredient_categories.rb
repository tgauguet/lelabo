class CreateIngredientCategories < ActiveRecord::Migration
  def change
    create_table :ingredient_categories do |t|
      t.integer :ingredient_id
      t.string :name

      t.timestamps null: false
    end
  end
end
