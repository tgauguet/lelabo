class AddUnitToProviderPrices < ActiveRecord::Migration
  def change
    add_column :provider_prices, :unit, :string
    add_column :provider_prices, :reference, :string
    add_column :provider_prices, :quantity, :integer
  end
end
