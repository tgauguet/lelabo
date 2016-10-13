class ChangeWeightToInteger < ActiveRecord::Migration
  def change
    change_column :quantities, :weight, :integer
  end
end
