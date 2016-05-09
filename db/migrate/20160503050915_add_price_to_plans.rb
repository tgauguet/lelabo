class AddPriceToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :price, :string
  end
end
