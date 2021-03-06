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

ActiveRecord::Schema.define(version: 2021_10_27_004903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "beans", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.integer "country", null: false
    t.string "farm"
    t.string "variety"
    t.integer "screen_size"
    t.string "img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "shop_id"
    t.float "rate_average", default: 0.0
    t.index ["shop_id"], name: "index_beans_on_shop_id"
    t.index ["user_id"], name: "index_beans_on_user_id"
  end

  create_table "beans_comments", force: :cascade do |t|
    t.text "content", null: false
    t.float "bitterness", null: false
    t.float "acidity", null: false
    t.float "body", null: false
    t.bigint "user_id", null: false
    t.bigint "bean_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bean_id"], name: "index_beans_comments_on_bean_id"
    t.index ["user_id"], name: "index_beans_comments_on_user_id"
  end

  create_table "shop_comments", force: :cascade do |t|
    t.text "content", null: false
    t.float "rate", null: false
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_shop_comments_on_shop_id"
    t.index ["user_id"], name: "index_shop_comments_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name", null: false
    t.integer "prefecture", null: false
    t.string "address", null: false
    t.string "TEL"
    t.text "URL"
    t.string "img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.float "rate_average", default: 0.0
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", limit: 100, default: "", null: false
    t.string "self_introduction", limit: 500
    t.string "img"
    t.boolean "is_deleted", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "beans", "shops"
  add_foreign_key "beans", "users"
  add_foreign_key "beans_comments", "beans"
  add_foreign_key "beans_comments", "users"
  add_foreign_key "shop_comments", "shops"
  add_foreign_key "shop_comments", "users"
  add_foreign_key "shops", "users"
end
