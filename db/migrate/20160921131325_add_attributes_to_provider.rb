class AddAttributesToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :name, :string
    add_column :providers, :adress, :string
    add_column :providers, :city, :string
    add_column :providers, :postal, :string
    add_column :providers, :country, :string
    add_column :providers, :email, :string
    add_column :providers, :website, :string
    add_column :providers, :phone, :string
    add_column :providers, :fax, :string
    add_column :providers, :mobile_phone, :string
    add_column :providers, :vat, :string
    add_column :providers, :siret, :string
    add_column :providers, :notes, :text
    add_column :providers, :user_id, :integer
  end
end
