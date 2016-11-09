class AddNutritionnalToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :protein, :integer
    add_column :ingredients, :carbohydrates, :integer
    add_column :ingredients, :salt, :integer
  end
end
