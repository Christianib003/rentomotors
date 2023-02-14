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

ActiveRecord::Schema[7.0].define(version: 2023_01_10_090151) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "release_year"
    t.string "color"
    t.string "transmission"
    t.integer "seats"
    t.string "wheel_drive"
    t.integer "price"
    t.string "image_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "date"
    t.date "reserved_from"
    t.date "reserved_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "car_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "encrypted_password"
    t.string "email"
    t.string "name", default: "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
