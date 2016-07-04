class AddStuffsToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :fat_percent, :decimal
    add_column :ingredients, :water_percent, :decimal
    add_column :ingredients, :sugar_percent, :decimal
    add_column :ingredients, :kcal, :decimal
    add_column :ingredients, :sugar_power, :decimal
    add_column :ingredients, :alcool_percent, :decimal
    add_column :ingredients, :dry_matter_percent, :decimal
    add_column :ingredients, :cocoa_percent, :decimal
    add_column :ingredients, :cocoa_butter_percent, :decimal
  end
end
