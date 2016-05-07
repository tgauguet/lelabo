class AddDescriptionsToToDoLists < ActiveRecord::Migration
  def change
    add_column :to_do_lists, :description, :string
  end
end
