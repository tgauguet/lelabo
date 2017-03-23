class AddToPublicToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :to_public, :integer
  end
end
