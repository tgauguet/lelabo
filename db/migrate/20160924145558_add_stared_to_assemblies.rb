class AddStaredToAssemblies < ActiveRecord::Migration
  def change
    add_column :assemblies, :stared, :boolean
  end
end
