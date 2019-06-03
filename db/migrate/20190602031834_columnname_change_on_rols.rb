class ColumnnameChangeOnRols < ActiveRecord::Migration[5.2]
  def change
    change_column :rols, :sinonimo, :string
    rename_column :rols, :sinonimo, :rol_name
  end
end
