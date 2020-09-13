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

ActiveRecord::Schema.define(version: 2020_09_13_183013) do

  create_table "customers", force: :cascade do |t|
    t.string "externalCore"
    t.string "name"
    t.string "email"
    t.string "contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inits", force: :cascade do |t|
    t.string "entrada"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "processamento"
    t.string "resposta"
  end

  create_table "items", force: :cascade do |t|
    t.string "externalCode"
    t.string "name"
    t.float "price"
    t.integer "quantity"
    t.float "total"
    t.integer "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "externalCode"
    t.integer "storeId"
    t.float "subTotal"
    t.float "deliveryFee"
    t.float "total"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "district"
    t.string "street"
    t.string "complement"
    t.float "latitude"
    t.float "longitude"
    t.date "dtOrderCreate"
    t.integer "postalCode"
    t.integer "number"
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "type"
    t.float "value"
    t.integer "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "typ"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  add_foreign_key "items", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "payments", "orders"
end
