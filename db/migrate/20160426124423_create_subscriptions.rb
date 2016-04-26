class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user
      t.references :plan
      t.string :stripe_id

      t.timestamps null: false
    end
  end
end
