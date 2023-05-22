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

ActiveRecord::Schema.define(version: 2023_05_20_123043) do

  create_table "electronics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "electronics_name", null: false
    t.string "mac_address", null: false
    t.boolean "is_wireless", null: false
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_electronics_on_user_id"
  end

  create_table "users", primary_key: "user_name", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "belongs", null: false
    t.boolean "is_special", null: false
    t.boolean "is_payment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "pre_payment", default: false
  end

  add_foreign_key "electronics", "users", primary_key: "user_name"
end
