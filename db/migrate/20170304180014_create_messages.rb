class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :email
      t.text :message
      t.string :subject

      t.timestamps null: false
    end
  end
end
