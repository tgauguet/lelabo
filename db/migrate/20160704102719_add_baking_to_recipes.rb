class AddBakingToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :baking, :string
  end
end
