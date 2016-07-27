class AddWeightToQuantities < ActiveRecord::Migration
  def change
    add_column :quantities, :weight, :decimal
  end
end
