class AddValorToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :valor, :bigint
  end
end
