class CreateProviderPrices < ActiveRecord::Migration
  def change
    create_table :provider_prices do |t|
      t.integer :ingredient_id
      t.decimal :price

      t.timestamps null: false
    end
  end
end
