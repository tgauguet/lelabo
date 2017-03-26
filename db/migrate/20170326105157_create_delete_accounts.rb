class CreateDeleteAccounts < ActiveRecord::Migration
  def change
    create_table :delete_accounts do |t|
      t.integer :user_id
      t.string :purpose
      t.text :comment

      t.timestamps null: false
    end
  end
end
