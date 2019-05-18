class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :nombre
      t.text :categoria
      t.text :descripcion
      t.text :medidas
      t.text :grosor
      t.text :densidad
      t.text :tipo_tela
      t.text :lamina
      t.text :cassata

      t.timestamps
    end
  end
end
