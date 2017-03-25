class AddPriorityToProviderPrices < ActiveRecord::Migration
  def change
    add_column :provider_prices, :priority, :integer
  end
end
