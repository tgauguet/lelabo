# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160628120420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.text     "message"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.decimal  "price",      precision: 9, scale: 2
    t.string   "name"
    t.string   "quantity"
    t.integer  "recipe_id"
    t.string   "unit"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
    t.integer  "position"
    t.integer  "priority"
    t.string   "category"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string   "stripe_id"
    t.string   "name"
    t.text     "description"
    t.string   "amount"
    t.string   "interval"
    t.boolean  "published"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "trial_period_days"
    t.string   "price"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.string   "stripe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.string   "due_date"
    t.string   "assigns_to"
    t.text     "details"
    t.integer  "to_do_list_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "done",          default: false
    t.string   "position"
    t.integer  "priority"
  end

  create_table "to_do_lists", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "oauthdelivered"
    t.string   "firstname"
    t.string   "company"
    t.string   "account_name"
    t.string   "name"
    t.boolean  "terms",                  default: false
    t.boolean  "admin",                  default: false
    t.string   "job_type"
    t.string   "phone"
    t.string   "skype"
    t.string   "company_image"
    t.string   "profile_image"
    t.string   "country"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "stripe_customer_id"
    t.string   "fournisseur"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
