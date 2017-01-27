class AddTempToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :baking_minutes, :integer
    add_column :recipes, :preparation_minutes, :integer
  end
end
