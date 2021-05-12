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

ActiveRecord::Schema.define(version: 2021_05_12_164747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.float "abv", null: false
    t.string "image_url"
    t.float "ibu"
    t.float "ph"
    t.float "beer_volume_value", null: false
    t.string "beer_volume_unit", null: false
    t.float "boil_volume_value", null: false
    t.string "boil_volume_unit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_beers_on_user_id"
  end

  create_table "hop_ingredients", force: :cascade do |t|
    t.string "ingredient_type"
    t.string "hop_ingredients", default: [], array: true
    t.bigint "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beer_id"], name: "index_hop_ingredients_on_beer_id"
  end

  create_table "malt_ingredients", force: :cascade do |t|
    t.string "ingredient_type"
    t.string "malt_ingredients", default: [], array: true
    t.bigint "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beer_id"], name: "index_malt_ingredients_on_beer_id"
  end

  create_table "mashes", force: :cascade do |t|
    t.float "mash_temp_value"
    t.string "mash_temp_unit"
    t.float "mash_temp_duration"
    t.float "fermentation_value"
    t.string "fermentation_unit"
    t.bigint "beer_id"
    t.index ["beer_id"], name: "index_mashes_on_beer_id"
  end

  create_table "punk_beers", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.float "abv", null: false
    t.string "image_url"
    t.float "ibu"
    t.float "ph"
    t.float "beer_volume_value", null: false
    t.string "beer_volume_unit", null: false
    t.float "boil_volume_value", null: false
    t.string "boil_volume_unit", null: false
    t.float "mash_temp_value"
    t.string "mash_temp_unit"
    t.float "mash_temp_duration"
    t.float "fermentation_value"
    t.string "fermentation_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "punk_ingredients", force: :cascade do |t|
    t.string "ingredient_type", null: false
    t.string "name", null: false
    t.float "amount_value", null: false
    t.string "amount_unit", null: false
    t.string "add_time"
    t.bigint "punk_beer_id", null: false
    t.index ["punk_beer_id"], name: "index_punk_ingredients_on_punk_beer_id"
  end

  create_table "punk_reviews", force: :cascade do |t|
    t.integer "rating", null: false
    t.integer "difficulty", null: false
    t.string "comment"
    t.bigint "punk_beer_id", null: false
    t.bigint "user_id", null: false
    t.index ["punk_beer_id"], name: "index_punk_reviews_on_punk_beer_id"
    t.index ["user_id"], name: "index_punk_reviews_on_user_id"
  end

  create_table "punk_yeast_ingredients", force: :cascade do |t|
    t.string "ingredient_type"
    t.string "name"
    t.bigint "punk_beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["punk_beer_id"], name: "index_punk_yeast_ingredients_on_punk_beer_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating", null: false
    t.integer "difficulty", null: false
    t.string "comment"
    t.bigint "beer_id", null: false
    t.bigint "user_id", null: false
    t.index ["beer_id"], name: "index_reviews_on_beer_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_photo"
    t.string "role", default: "member", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "yeast_ingredients", force: :cascade do |t|
    t.string "ingredient_type"
    t.string "name"
    t.bigint "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beer_id"], name: "index_yeast_ingredients_on_beer_id"
  end

end
