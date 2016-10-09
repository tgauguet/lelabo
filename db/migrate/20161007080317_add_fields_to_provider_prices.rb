class AddFieldsToProviderPrices < ActiveRecord::Migration
  def change
    add_column :provider_prices, :provider_id, :integer
  end
end
