class CreateApodos < ActiveRecord::Migration
  def change
    create_table :apodos do |t|
      t.string :autor_id
      t.string :nombre
      t.string :prefijo
      t.string :descripcion
      t.string :imagen_url
      t.float :calificacion
      t.boolean :visible
      t.boolean :destacado
      t.datetime :fecha_creacion
      t.datetime :fecha_actualizacion
    end
  end
end
