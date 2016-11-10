class AddUnitToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :unit, :string
  end
end
