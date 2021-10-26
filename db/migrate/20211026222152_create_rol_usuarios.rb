class CreateRolUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :rol_usuarios do |t|
      t.references :user, null: false, foreign_key: true
      t.references :rol, null: false, foreign_key: true

      t.timestamps
    end
  end
end
