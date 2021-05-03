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

ActiveRecord::Schema.define(version: 2021_05_03_175640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amounts", force: :cascade do |t|
    t.bigint "beer_id", null: false
    t.bigint "ingredient_id", null: false
    t.decimal "value"
    t.string "unit", null: false
    t.index ["beer_id"], name: "index_amounts_on_beer_id"
    t.index ["ingredient_id"], name: "index_amounts_on_ingredient_id"
  end

  create_table "beers", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.decimal "abv", null: false
    t.string "image_url"
    t.integer "ibu"
    t.decimal "ph", null: false
    t.decimal "beer_volume_value", null: false
    t.string "beer_volume_unit", null: false
    t.decimal "boil_volume_value", null: false
    t.string "boil_volume_unit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "methods", force: :cascade do |t|
    t.string "twist"
    t.integer "mash_temp_value", null: false
    t.string "mash_temp_unit", null: false
    t.integer "mash_temp_duration", null: false
    t.integer "fermentation_value", null: false
    t.string "fermentation_unit", null: false
    t.bigint "beer_id", null: false
    t.index ["beer_id"], name: "index_methods_on_beer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
