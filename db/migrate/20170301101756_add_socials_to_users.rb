class AddSocialsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_link, :string
    add_column :users, :linkedin_link, :string
    add_column :users, :google_link, :string
    add_column :users, :instagram_link, :string
  end
end
