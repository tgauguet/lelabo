class ChangeDecimalToFloat < ActiveRecord::Migration
  def change
    change_table :ingredients do |t|
      t.change :price, :float
      t.change :fat_percent, :float
      t.change :water_percent, :float
      t.change :sugar_percent, :float
      t.change :kcal, :float
      t.change :sugar_power, :float
      t.change :alcool_percent, :float
      t.change :dry_matter_percent, :float
      t.change :cocoa_percent, :float
      t.change :cocoa_butter_percent, :float
      t.change :cocoa_total_percent, :float
    end
    change_table :quantities do |t|
      t.change :quantity, :float
    end
    change_table :recipe_items do |t|
      t.change :total, :float
    end
    change_table :recipes do |t|
      t.change :portion_price, :float
    end
    change_table :totals do |t|
      t.change :value, :float
    end
  end
end
