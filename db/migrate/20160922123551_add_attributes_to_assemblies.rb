class AddAttributesToAssemblies < ActiveRecord::Migration
  def change
    add_column :assemblies, :owner, :string
    add_column :assemblies, :category, :string
    add_column :assemblies, :user_id, :integer
    add_column :assemblies, :notes, :text
  end
end
