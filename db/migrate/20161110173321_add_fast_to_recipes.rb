class AddFastToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :fast, :boolean, default: true
  end
end
