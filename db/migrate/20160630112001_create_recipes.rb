class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :author
    	t.integer :ingredient_id
    	t.string :name
    	t.text :description
    	t.text :process
    	t.text :note
    	t.text :equipment
    	t.string :category
    	t.integer :user_id
    	t.attachment :image
      	t.timestamps null: false
    end
  end
end
