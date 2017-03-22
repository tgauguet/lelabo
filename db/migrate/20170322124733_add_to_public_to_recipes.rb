class AddToPublicToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :to_public, :boolean
  end
end
