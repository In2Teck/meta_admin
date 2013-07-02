class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :facebook_id
      t.string :nombre
      t.string :apellido
      t.string :email
      t.boolean :es_fan

      t.timestamps
    end
  end
end
