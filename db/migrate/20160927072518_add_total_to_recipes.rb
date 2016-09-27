class AddTotalToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :total, :decimal
  end
end
