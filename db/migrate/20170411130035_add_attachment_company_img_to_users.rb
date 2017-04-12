class AddAttachmentCompanyImgToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :company_img
    end
  end

  def self.down
    remove_attachment :users, :company_img
  end
end
