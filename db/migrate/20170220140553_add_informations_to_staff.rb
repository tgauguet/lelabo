class AddInformationsToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :name, :string
    add_column :staffs, :firstname, :string
    add_column :staffs, :cost_by_hour, :float
    add_column :staffs, :address, :string
    add_column :staffs, :city, :string
    add_column :staffs, :phone, :string
    add_column :staffs, :postal, :string
    add_column :staffs, :email, :string
  end
end
