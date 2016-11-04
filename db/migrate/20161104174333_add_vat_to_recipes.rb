class AddVatToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :vat, :float
  end
end
