class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :due_date
      t.string :assigns_to
      t.text :details
      t.integer :to_do_list_id

      t.timestamps null: false
    end
  end
end
