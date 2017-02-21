class AddAttachmentPhotoToStaffs < ActiveRecord::Migration
  def self.up
    change_table :staffs do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :staffs, :photo
  end
end
