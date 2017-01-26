class AddArrayUnitToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :array_unit, :string
  end
end
