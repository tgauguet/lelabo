class AddPostToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :job, :string
    add_column :staffs, :employed_since, :string
    add_column :staffs, :user_id, :integer
  end
end
