class CreateOrdenProyectos < ActiveRecord::Migration[6.1]
  def change
    create_table :orden_proyectos do |t|
      t.references :orden, null: false, foreign_key: true
      t.references :proyecto, null: false, foreign_key: true
      t.string :instrucciones

      t.timestamps
    end
  end
end
