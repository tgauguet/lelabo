class AddCheckboxesToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :is_bio, :boolean
    add_column :ingredients, :is_glut_free, :boolean
  end
end
