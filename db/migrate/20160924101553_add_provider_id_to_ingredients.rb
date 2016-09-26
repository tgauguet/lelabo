class AddProviderIdToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :provider_id, :integer
  end
end
