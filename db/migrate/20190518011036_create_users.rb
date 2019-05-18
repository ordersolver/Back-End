class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :tipo_documento
      t.text :nombre
      t.text :apellidos
      t.text :direccion
      t.text :telefono

      t.timestamps
    end
  end
end
