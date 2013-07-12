class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :facebook_id
      t.string :nombre
      t.string :apellido
      t.string :email
      t.string :es_fan
      t.datetime :fecha_creacion
      t.datetime :fecha_actualizacion
    end
  end
end
