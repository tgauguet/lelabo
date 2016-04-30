class AddStuffsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :job_type, :string
    add_column :users, :phone, :string
    add_column :users, :skype, :string
    add_column :users, :company_image, :string
    add_column :users, :profile_image, :string
    add_column :users, :country, :string
  end
end
