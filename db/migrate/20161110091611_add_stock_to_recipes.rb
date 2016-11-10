class AddStockToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :stock, :integer
    add_column :recipes, :to_produce, :integer
    add_column :recipes, :sold, :integer
  end
end
