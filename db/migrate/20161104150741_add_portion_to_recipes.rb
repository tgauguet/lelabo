class AddPortionToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :portion, :string
    add_column :recipes, :portion_weight, :integer
    add_column :recipes, :portion_price, :decimal
  end
end
