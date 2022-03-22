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

ActiveRecord::Schema.define(version: 2022_02_25_023931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administradors", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "cpf"
    t.string "senha"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome_empresa"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "leituras", force: :cascade do |t|
    t.float "valor"
    t.bigint "sensor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sensor_id"], name: "index_leituras_on_sensor_id"
  end

  create_table "sensors", force: :cascade do |t|
    t.string "nome_sensor"
    t.bigint "cliente_id", null: false
    t.bigint "tipo_sensor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "Li"
    t.float "Ls"
    t.index ["cliente_id"], name: "index_sensors_on_cliente_id"
    t.index ["tipo_sensor_id"], name: "index_sensors_on_tipo_sensor_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "flag"
    t.bigint "sensor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "flag_rearme"
    t.integer "flag_mantec"
    t.index ["sensor_id"], name: "index_statuses_on_sensor_id"
  end

  create_table "tipo_sensors", force: :cascade do |t|
    t.string "tipo_sensor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "cpf"
    t.bigint "cliente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "celular"
    t.integer "sms"
    t.string "senha"
    t.index ["cliente_id"], name: "index_usuarios_on_cliente_id"
  end

  add_foreign_key "leituras", "sensors"
  add_foreign_key "sensors", "clientes"
  add_foreign_key "sensors", "tipo_sensors"
  add_foreign_key "statuses", "sensors"
  add_foreign_key "usuarios", "clientes"
end
