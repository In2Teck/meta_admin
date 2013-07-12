class CreateObjetos < ActiveRecord::Migration
  def change
    create_table :objetos do |t|
      t.integer :categoria_id
      t.string :descripcion
      t.string :imagen_url
      t.datetime :fecha_creacion
      t.datetime :fecha_actualizacion
    end
  end
end
