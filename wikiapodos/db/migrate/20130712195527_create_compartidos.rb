class CreateCompartidos < ActiveRecord::Migration
  def change
    create_table :compartidos do |t|
      t.string :usuario_id
      t.integer :apodo_id
      t.string :origen
      t.datetime :fecha_creacion
      t.datetime :fecha_actualizacion
    end
  end
end
