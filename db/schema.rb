#---
# Excerpted from "Modern Front-End Development for Rails, Second Edition",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/nrclient2 for more book information.
#---
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

ActiveRecord::Schema[7.0].define(version: 2021_11_23_225534) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_enum :enum_access, [
    "general",
    "members",
    "vips",
  ], force: :cascade

  create_enum :enum_ilk, [
    "concert",
    "meet_n_greet",
    "battle",
  ], force: :cascade

  create_enum :enum_status, [
    "unsold",
    "held",
    "purchased",
    "refunded",
  ], force: :cascade

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "genre_tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concerts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start_time"
    t.bigint "venue_id", null: false
    t.text "genre_tags"
    t.string "ilk"
    t.string "access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_id"], name: "index_concerts_on_venue_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "concert_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concert_id"], name: "index_favorites_on_concert_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "gigs", force: :cascade do |t|
    t.bigint "band_id", null: false
    t.bigint "concert_id", null: false
    t.integer "order"
    t.integer "duration_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_gigs_on_band_id"
    t.index ["concert_id"], name: "index_gigs_on_concert_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "ticket_orders", force: :cascade do |t|
    t.bigint "concert_id", null: false
    t.string "status"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shopping_carts_id"
    t.index ["concert_id"], name: "index_ticket_orders_on_concert_id"
    t.index ["shopping_carts_id"], name: "index_ticket_orders_on_shopping_carts_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "concert_id", null: false
    t.integer "row"
    t.integer "number"
    t.bigint "user_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ticket_orders_id"
    t.bigint "shopping_carts_id"
    t.index ["concert_id"], name: "index_tickets_on_concert_id"
    t.index ["shopping_carts_id"], name: "index_tickets_on_shopping_carts_id"
    t.index ["ticket_orders_id"], name: "index_tickets_on_ticket_orders_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "rows"
    t.integer "seats_per_row"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "concerts", "venues"
  add_foreign_key "favorites", "concerts"
  add_foreign_key "favorites", "users"
  add_foreign_key "gigs", "bands"
  add_foreign_key "gigs", "concerts"
  add_foreign_key "shopping_carts", "users"
  add_foreign_key "ticket_orders", "concerts"
  add_foreign_key "ticket_orders", "shopping_carts", column: "shopping_carts_id"
  add_foreign_key "tickets", "concerts"
  add_foreign_key "tickets", "shopping_carts", column: "shopping_carts_id"
  add_foreign_key "tickets", "ticket_orders", column: "ticket_orders_id"
  add_foreign_key "tickets", "users"
end
