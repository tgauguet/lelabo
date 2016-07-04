class CreateAssemblies < ActiveRecord::Migration
  def change
    create_table :assemblies do |t|
      t.attachment :image
      t.integer :recipe_id
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
