class CreateReportes < ActiveRecord::Migration
  def change
    create_table :reportes do |t|
      t.string :usuario_id
      t.string :apodo_id
      t.string :fecha
      t.text :razon
      t.datetime :fecha_creacion
      t.datetime :fecha_actualizacion
    end
  end
end
