class CreateOrdens < ActiveRecord::Migration[6.1]
  def change
    create_table :ordens do |t|
      t.references :cliente, null: false, foreign_key: true
      t.string :codigo
      t.date :proceso
      t.date :entrega
      t.date :cierre

      t.timestamps
    end
  end
end
