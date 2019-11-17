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

ActiveRecord::Schema.define(version: 2019_11_16_033713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comics", force: :cascade do |t|
    t.string "title"
    t.string "comic_file"
    t.string "isbn"
    t.string "genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_comics_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "type"
    t.text "text"
    t.integer "rating"
    t.integer "replied_to"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "comic_id"
    t.bigint "user_id"
    t.index ["comic_id"], name: "index_posts_on_comic_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  create_table "requests", force: :cascade do |t|
    t.string "acc_type"
    t.string "resaon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "username"
    t.string "email"
    t.string "password"
    t.string "security_q"
    t.string "security_a"
    t.string "bio"
    t.string "recommendations"
    t.string "admin_code"
    t.string "form"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comics", "users"
  add_foreign_key "posts", "comics"
  add_foreign_key "posts", "users"
end
