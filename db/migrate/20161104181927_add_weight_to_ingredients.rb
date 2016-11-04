class AddWeightToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :weight, :integer
    add_column :ingredients, :unit_quantity, :integer
    add_column :ingredients, :unit_weight, :integer
  end
end
