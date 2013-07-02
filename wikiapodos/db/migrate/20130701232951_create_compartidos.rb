class CreateCompartidos < ActiveRecord::Migration
  def change
    create_table :compartidos do |t|
      t.integer :usuario_id
      t.integer :apodo_id
      t.string :origen

      t.timestamps
    end
  end
end
