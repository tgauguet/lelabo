class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer :ingredient_id

      t.timestamps null: false
    end
  end
end
