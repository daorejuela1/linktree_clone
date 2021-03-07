class RenameBioFromUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :bio, :description
  end
end
