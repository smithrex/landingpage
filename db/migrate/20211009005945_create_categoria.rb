class CreateCategoria < ActiveRecord::Migration[6.1]
  def change
    create_table :categoria do |t|
      t.string :nombre
      t.string :imagen

      t.timestamps
    end
  end
end
