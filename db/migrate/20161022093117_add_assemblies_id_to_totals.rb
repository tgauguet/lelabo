class AddAssembliesIdToTotals < ActiveRecord::Migration
  def change
    add_column :totals, :assembly_id, :integer
  end
end
