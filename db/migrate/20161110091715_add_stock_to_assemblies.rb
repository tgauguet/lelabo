class AddStockToAssemblies < ActiveRecord::Migration
  def change
    add_column :assemblies, :stock, :integer
    add_column :assemblies, :to_produce, :integer
    add_column :assemblies, :sold, :integer
  end
end
