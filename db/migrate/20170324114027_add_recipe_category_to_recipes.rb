class AddRecipeCategoryToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :recipe_category_id, :integer
  end
end
