# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_14_021534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pago_detalles", force: :cascade do |t|
    t.bigint "pago_id"
    t.bigint "user_id"
    t.decimal "monto_comision"
    t.index ["pago_id"], name: "index_pago_detalles_on_pago_id"
    t.index ["user_id"], name: "index_pago_detalles_on_user_id"
  end

  create_table "pagos", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "monto_usd"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pagos_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "nombre"
    t.integer "porcentaje_comision"
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
    t.string "user"
    t.string "telefono"
    t.integer "parent_id"
    t.bigint "plan_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["plan_id"], name: "index_users_on_plan_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
