class AddFieldsToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :stabilizer, :integer
  end
end
