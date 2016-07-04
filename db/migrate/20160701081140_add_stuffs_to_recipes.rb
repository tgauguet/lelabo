class AddStuffsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :step_id, :integer
  end
end
