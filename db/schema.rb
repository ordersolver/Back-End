# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_17_034001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.datetime "fecha"
    t.string "estado"
    t.text "direccion_entrega"
    t.bigint "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_products", id: false, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
  end

  create_table "products", force: :cascade do |t|
    t.text "nombre"
    t.text "categoria"
    t.text "descripcion"
    t.text "medidas"
    t.text "grosor"
    t.text "densidad"
    t.text "tipo_tela"
    t.text "lamina"
    t.text "cassata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "valor"
  end

  create_table "rols", force: :cascade do |t|
    t.string "rol_name"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rols_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "rol_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "tipo_documento"
    t.text "nombre"
    t.text "apellidos"
    t.text "direccion"
    t.text "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "no_id"
    t.string "email"
    t.text "google_id"
  end

  add_foreign_key "orders", "users"
end
