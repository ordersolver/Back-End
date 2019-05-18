class CreateJoinTableUserRol < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :rols do |t|
      # t.index [:user_id, :rol_id]
      # t.index [:rol_id, :user_id]
    end
  end
end
