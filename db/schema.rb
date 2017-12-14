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

ActiveRecord::Schema.define(version: 20171214101834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charities", force: :cascade do |t|
    t.string "name"
    t.string "immatriculation"
    t.string "address"
    t.string "phone_number"
    t.string "email"
    t.string "contact_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "donations", force: :cascade do |t|
    t.date "execution_date"
    t.bigint "project_id"
    t.bigint "subscription_id"
    t.bigint "user_id"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_cents", default: 0, null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_donations_on_order_id"
    t.index ["project_id"], name: "index_donations_on_project_id"
    t.index ["subscription_id"], name: "index_donations_on_subscription_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "status"
    t.integer "amount_cents", default: 0, null: false
    t.jsonb "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_nb"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "contact_name"
    t.string "address"
    t.date "start_date"
    t.date "end_date"
    t.bigint "charity_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "budget_cents", default: 0, null: false
    t.integer "environment"
    t.integer "humanitarian"
    t.integer "social"
    t.integer "preservation"
    t.integer "research"
    t.integer "local"
    t.integer "abroad"
    t.integer "urgency"
    t.integer "education"
    t.integer "completion_rate", default: 0
    t.string "photo"
    t.float "latitude"
    t.float "longitude"
    t.index ["charity_id"], name: "index_projects_on_charity_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.integer "minimum_donation"
    t.text "description"
    t.date "delivery_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.index ["project_id"], name: "index_rewards_on_project_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.date "subscription_date"
    t.integer "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_cents", default: 0, null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "first_name"
    t.string "last_name"
    t.integer "environment"
    t.integer "humanitarian"
    t.integer "social"
    t.integer "preservation"
    t.integer "research"
    t.integer "local"
    t.integer "abroad"
    t.integer "education"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "donations", "orders"
  add_foreign_key "donations", "projects"
  add_foreign_key "donations", "subscriptions"
  add_foreign_key "donations", "users"
  add_foreign_key "projects", "charities"
  add_foreign_key "subscriptions", "users"
end
