class CreateProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :imagen
      t.string :descripcion
      t.references :categorium, null: false, foreign_key: true

      t.timestamps
    end
  end
end
