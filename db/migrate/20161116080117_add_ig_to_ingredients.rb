class AddIgToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :ig, :integer
  end
end
