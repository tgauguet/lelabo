class AddLovedToAssemblies < ActiveRecord::Migration
  def change
    add_column :assemblies, :loved, :boolean
  end
end
