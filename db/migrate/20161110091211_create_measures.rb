class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.string :name
      t.integer :weight
      t.integer :recipe_id
      t.integer :assembly_id

      t.timestamps null: false
    end
    add_index :measures, :name
    add_index :measures, :recipe_id
    add_index :measures, :assembly_id
  end
end
