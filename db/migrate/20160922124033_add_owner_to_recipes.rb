class AddOwnerToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :owner, :string
  end
end
