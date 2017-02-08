class AddAllergenToProduct < ActiveRecord::Migration
  def change
    add_column :recipes, :allergen, :string, array: true, default: []
  end
end
