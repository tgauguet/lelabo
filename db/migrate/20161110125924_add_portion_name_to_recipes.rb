class AddPortionNameToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :portion_name, :string
  end
end
