class AddCitextToIngredients < ActiveRecord::Migration
  def change
    enable_extension :citext
    change_column :ingredients, :name, :citext
  end
end
