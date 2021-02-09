class CreateProyectos < ActiveRecord::Migration[5.2]
  def change
    create_table :proyectos do |t|
      t.string :nombre
      t.string :descripcion
      t.date :fecha_comienzo
      t.date :fecha_termino
      t.string :estado

      t.timestamps
    end
  end
end
