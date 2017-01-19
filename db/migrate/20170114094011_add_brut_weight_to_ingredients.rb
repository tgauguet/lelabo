class AddBrutWeightToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :brut_weight, :integer
  end
end
