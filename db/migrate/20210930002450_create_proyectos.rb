class CreateProyectos < ActiveRecord::Migration[6.1]
  def change
    create_table :proyectos do |t|
      t.string :nombre
      t.string :imagen

      t.timestamps
    end
  end
end
