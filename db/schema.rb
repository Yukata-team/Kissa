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

ActiveRecord::Schema.define(version: 2020_03_09_032412) do

  create_table "posts", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "user_id"
    t.float "post_total_point"
    t.float "congestion"
    t.float "menu"
    t.float "price"
    t.float "wifi"
    t.float "others"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "review"
  end

  create_table "searches", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_images", force: :cascade do |t|
    t.integer "shop_id"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.float "total_point"
    t.string "station_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "ave_congestion"
    t.float "ave_menu"
    t.float "ave_price"
    t.float "ave_wifi"
    t.float "ave_others"
    t.string "image_id"
    t.string "branch"
    t.string "furigana"
    t.integer "user_id"
    t.string "other_name"
    t.text "business_hour"
    t.string "head_image_id"
    t.integer "postcode"
    t.string "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
  end

  create_table "stations", force: :cascade do |t|
    t.integer "station_id"
    t.string "station_name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_image_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
