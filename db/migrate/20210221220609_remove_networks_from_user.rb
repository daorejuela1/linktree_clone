class RemoveNetworksFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :twitter, :string
    remove_column :users, :instagram, :string
    remove_column :users, :facebook, :string
  end
end
