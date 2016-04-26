class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :stripe_id
      t.string :name
      t.text :description
      t.string :amount
      t.string :interval
      t.boolean :published

      t.timestamps null: false
    end
  end
end
