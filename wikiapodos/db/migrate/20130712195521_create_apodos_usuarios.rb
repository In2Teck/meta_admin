class CreateApodosUsuarios < ActiveRecord::Migration
  def change
    create_table :apodos_usuarios do |t|
      t.string :usuario_desde_id
      t.string :usuario_para_id
      t.integer :apodo_id
      t.string :status
      t.boolean :visible
      t.datetime :fecha_creacion
      t.datetime :fecha_actualizacion
    end
  end
end
