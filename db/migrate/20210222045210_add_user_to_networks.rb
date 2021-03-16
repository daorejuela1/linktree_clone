class AddUserToNetworks < ActiveRecord::Migration[6.1]
  def change
    add_reference :networks, :user, null: false, foreign_key: true
  end
end
