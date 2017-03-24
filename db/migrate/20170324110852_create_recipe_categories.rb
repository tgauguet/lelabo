class CreateRecipeCategories < ActiveRecord::Migration
  def change
    create_table :recipe_categories do |t|
      t.string :name
      t.integer :recipe_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
