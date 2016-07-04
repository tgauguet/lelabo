class AddOrderingToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :ordering, :string
  end
end
