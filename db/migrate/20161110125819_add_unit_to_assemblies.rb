class AddUnitToAssemblies < ActiveRecord::Migration
  def change
    add_column :assemblies, :unit, :string
  end
end
