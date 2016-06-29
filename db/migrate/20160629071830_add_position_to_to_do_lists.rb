class AddPositionToToDoLists < ActiveRecord::Migration
  def change
    add_column :to_do_lists, :position, :integer
    add_column :to_do_lists, :priority, :integer
  end
end
