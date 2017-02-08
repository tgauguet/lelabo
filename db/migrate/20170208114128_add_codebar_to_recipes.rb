class AddCodebarToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :codebar, :int, limit: 12
  end
end
