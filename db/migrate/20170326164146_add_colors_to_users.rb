class AddColorsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :colors, :integer
  end
end
