class AddPortionNumberToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :portion_number, :integer
  end
end
