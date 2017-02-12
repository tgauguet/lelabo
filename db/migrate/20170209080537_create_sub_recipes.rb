class CreateSubRecipes < ActiveRecord::Migration
  def change
    create_table :sub_recipes do |t|
      t.integer :weight
      t.integer :recipe_id
      t.integer :sub_id

      t.timestamps null: false
    end
  end
end
