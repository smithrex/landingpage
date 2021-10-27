# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_26_222152) do

  create_table "categoria", force: :cascade do |t|
    t.string "nombre"
    t.string "imagen"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "nombres"
    t.string "apell_pat"
    t.string "apell_mat"
    t.string "nif"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_clientes_on_user_id"
  end

  create_table "orden_entregas", force: :cascade do |t|
    t.integer "orden_id", null: false
    t.date "fecha"
    t.string "instrucciones"
    t.string "direccion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["orden_id"], name: "index_orden_entregas_on_orden_id"
  end

  create_table "orden_productos", force: :cascade do |t|
    t.integer "orden_id", null: false
    t.integer "producto_id", null: false
    t.integer "cantidad"
    t.decimal "precio"
    t.string "instrucciones"
    t.decimal "descuento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["orden_id"], name: "index_orden_productos_on_orden_id"
    t.index ["producto_id"], name: "index_orden_productos_on_producto_id"
  end

  create_table "orden_proyectos", force: :cascade do |t|
    t.integer "orden_id", null: false
    t.integer "proyecto_id", null: false
    t.string "instrucciones"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["orden_id"], name: "index_orden_proyectos_on_orden_id"
    t.index ["proyecto_id"], name: "index_orden_proyectos_on_proyecto_id"
  end

  create_table "ordens", force: :cascade do |t|
    t.integer "cliente_id", null: false
    t.string "codigo"
    t.date "proceso"
    t.date "entrega"
    t.date "cierre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_ordens_on_cliente_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.string "imagen"
    t.string "descripcion"
    t.integer "categorium_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categorium_id"], name: "index_productos_on_categorium_id"
  end

  create_table "proyectos", force: :cascade do |t|
    t.string "nombre"
    t.string "imagen"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rol_usuarios", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "rol_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rol_id"], name: "index_rol_usuarios_on_rol_id"
    t.index ["user_id"], name: "index_rol_usuarios_on_user_id"
  end

  create_table "rols", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clientes", "users"
  add_foreign_key "orden_entregas", "ordens"
  add_foreign_key "orden_productos", "ordens"
  add_foreign_key "orden_productos", "productos"
  add_foreign_key "orden_proyectos", "ordens"
  add_foreign_key "orden_proyectos", "proyectos"
  add_foreign_key "ordens", "clientes"
  add_foreign_key "productos", "categoria"
  add_foreign_key "rol_usuarios", "rols"
  add_foreign_key "rol_usuarios", "users"
end
