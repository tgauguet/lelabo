class AddStickerInfoToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :production_date, :string
    add_column :recipes, :production_number, :string
    add_column :recipes, :conservation, :string
    add_column :recipes, :consumption_days, :integer
  end
end
