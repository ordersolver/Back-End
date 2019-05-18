class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :fecha
      t.string :estado
      t.text :direccion_entrega
      t.bigint :valor

      t.timestamps
    end
  end
end
