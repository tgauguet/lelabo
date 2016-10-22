class CreateRecipeItems < ActiveRecord::Migration
  def change
    create_table :recipe_items do |t|
      t.integer :recipe_id
      t.integer :assembly_id
      t.decimal :total

      t.timestamps null: false
    end
  end
end
