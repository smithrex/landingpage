class CreateClientes < ActiveRecord::Migration[6.1]
  def change
    create_table :clientes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nombres
      t.string :apell_pat
      t.string :apell_mat
      t.string :nif

      t.timestamps
    end
  end
end
