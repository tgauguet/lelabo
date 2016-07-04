class AddCocoaTotalPercentToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :cocoa_total_percent, :decimal
  end
end
