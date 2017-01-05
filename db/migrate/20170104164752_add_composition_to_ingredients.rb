class AddCompositionToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :composition, :text
  end
end
