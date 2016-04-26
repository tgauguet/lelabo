class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :message
      t.string :email

      t.timestamps null: false
    end
  end
end
