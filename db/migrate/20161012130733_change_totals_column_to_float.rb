class ChangeTotalsColumnToFloat < ActiveRecord::Migration
  def change
    change_column :totals, :value, :decimal, precision: 5, scale: 2
  end
end
