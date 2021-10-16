class CreateOrdenEntregas < ActiveRecord::Migration[6.1]
  def change
    create_table :orden_entregas do |t|
      t.references :orden, null: false, foreign_key: true
      t.date :fecha
      t.string :instrucciones
      t.string :direccion

      t.timestamps
    end
  end
end
