class CreateCalificaciones < ActiveRecord::Migration
  def change
    create_table :calificaciones do |t|
      t.string :usuario_id
      t.integer :apodo_id
      t.integer :calificacion
      t.datetime :fecha_creacion
      t.datetime :fecha_actualizacion
    end
  end
end
