class AddUserIdToProviderPrices < ActiveRecord::Migration
  def change
    add_column :provider_prices, :user_id, :integer
  end
end
