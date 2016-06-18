class AddFournisseurToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fournisseur, :string
  end
end
