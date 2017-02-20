class AddPhotoToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :photo, :string
  end
end
