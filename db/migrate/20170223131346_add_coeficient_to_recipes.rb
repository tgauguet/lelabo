class AddCoeficientToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :coef, :float
  end
end
