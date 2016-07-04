class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :title
      t.text :description
      t.string :baking

      t.timestamps null: false
    end
  end
end
