class CreateToDoLists < ActiveRecord::Migration
  def change
    create_table :to_do_lists do |t|
      t.string :title
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
