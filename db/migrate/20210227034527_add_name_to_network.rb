class AddNameToNetwork < ActiveRecord::Migration[6.1]
  def change
    add_column :networks, :name, :string
  end
end
