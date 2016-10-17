class AddLovedToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :loved, :boolean
  end
end
