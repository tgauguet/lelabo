class AddPriorityToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :priority, :integer
  end
end
