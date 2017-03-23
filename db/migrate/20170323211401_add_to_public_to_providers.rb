class AddToPublicToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :to_public, :boolean
  end
end
