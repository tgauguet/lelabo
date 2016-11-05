class AddIndexes < ActiveRecord::Migration
  def change
    add_index :assemblies, :recipe_id
    add_index :assemblies, :user_id
    add_index :feedbacks, :user_id
    add_index :images, :recipe_id
    add_index :images, :assembly_id
    add_index :ingredients, :recipe_id
    add_index :ingredients, :user_id
    add_index :ingredients, :provider_id
    add_index :provider_prices, :ingredient_id
    add_index :provider_prices, :provider_id
    add_index :providers, :ingredient_id
    add_index :providers, :user_id
    add_index :quantities, :ingredient_id
    add_index :quantities, :recipe_id
    add_index :recipe_items, :recipe_id
    add_index :recipe_items, :assembly_id
    add_index :recipes, :ingredient_id
    add_index :recipes, :user_id
    add_index :recipes, :step_id
    add_index :subscriptions, :user_id
    add_index :subscriptions, :plan_id
    add_index :tasks, :to_do_list_id
    add_index :to_do_lists, :user_id
    add_index :totals, :recipe_id
    add_index :totals, :assembly_id
  end
end
