class CreateNetworks < ActiveRecord::Migration[6.1]
  def change
    create_table :networks do |t|
      t.string :link

      t.timestamps
    end
  end
end
