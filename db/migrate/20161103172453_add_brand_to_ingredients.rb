class AddBrandToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :brand, :string
    add_column :ingredients, :vat, :integer
  end
end
