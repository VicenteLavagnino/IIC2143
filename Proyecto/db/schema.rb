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


ActiveRecord::Schema[7.0].define(version: 2023_11_21_204451) do

ActiveRecord::Schema[7.0].define(version: 2023_11_21_150050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.bigint "user1_id"
    t.bigint "user2_id"
    t.datetime "time_last_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user1_id"], name: "index_chats_on_user1_id"
    t.index ["user2_id"], name: "index_chats_on_user2_id"
  end

  create_table "exchange_dones", force: :cascade do |t|
    t.string "seller_name"
    t.string "bidder_name"
    t.string "seller_product"
    t.string "bidder_product"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.integer "seller_id"
    t.integer "bidder_id"
    t.string "seller_product_name"
    t.string "bidder_product_name"
    t.index ["bidder_id"], name: "index_exchange_dones_on_bidder_id"
    t.index ["seller_id"], name: "index_exchange_dones_on_seller_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "offer_id"
    t.string "seller_state"
    t.string "bidder_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_exchanges_on_offer_id"
    t.index ["product_id"], name: "index_exchanges_on_product_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.string "name"
    t.string "set"
    t.text "description"
    t.string "image"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_offers_on_product_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "product_reports", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "motivo"
    t.index ["product_id"], name: "index_product_reports_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.string "set"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.text "description"
    t.date "date"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_requests_on_product_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rate"
    t.text "content"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
  end

  create_table "user_reports", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "motivo"
    t.index ["user_id"], name: "index_user_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.text "description"
    t.string "image"
    t.string "phone_number"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "exchanges", "offers"
  add_foreign_key "exchanges", "products"

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_wishlists_on_product_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end


  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "offers", "products"
  add_foreign_key "offers", "users"
  add_foreign_key "product_reports", "products"
  add_foreign_key "products", "users"
  add_foreign_key "requests", "products"
  add_foreign_key "reviews", "products"
  add_foreign_key "user_reports", "users"
  add_foreign_key "wishlists", "products"
  add_foreign_key "wishlists", "users"
end
