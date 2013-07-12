class CreateCuerpos < ActiveRecord::Migration
  def change
    create_table :cuerpos do |t|
      t.string :descripcion
      t.string :imagen_url
      t.datetime :fecha_creacion
      t.datetime :fecha_actualizacion
    end
  end
end
