class AddBarToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :bar, :bigint
  end
end
