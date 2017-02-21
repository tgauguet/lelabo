class AddEquilibriumValueToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :eq_data, :string
    add_column :recipes, :cost_data, :integer
  end
end
