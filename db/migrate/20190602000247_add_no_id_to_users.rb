class AddNoIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :no_id, :string
  end
end
