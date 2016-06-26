class AddPositionToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :position, :integer
  end
end
