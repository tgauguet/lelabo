class AddOauthdeliveredToUsers < ActiveRecord::Migration
  def change
    add_column :users, :oauthdelivered, :boolean
    add_column :users, :firstname, :string
    add_column :users, :company, :string
  end
end
