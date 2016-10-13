class AddRecipeIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :recipe_id, :integer
    add_column :images, :assembly_id, :integer
  end
end
