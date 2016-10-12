class AddIsPulpToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :is_pulp, :boolean, default: false
  end
end
