class AddStaredToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :stared, :boolean
  end
end
