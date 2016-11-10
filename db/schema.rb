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

ActiveRecord::Schema.define(version: 20161110091611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assemblies", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "recipe_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "owner"
    t.string   "category"
    t.integer  "user_id"
    t.text     "notes"
    t.boolean  "stared"
    t.boolean  "loved"
  end

  add_index "assemblies", ["recipe_id"], name: "index_assemblies_on_recipe_id", using: :btree
  add_index "assemblies", ["user_id"], name: "index_assemblies_on_user_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.text     "message"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "feedbacks", ["user_id"], name: "index_feedbacks_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "recipe_id"
    t.integer  "assembly_id"
  end

  add_index "images", ["assembly_id"], name: "index_images_on_assembly_id", using: :btree
  add_index "images", ["recipe_id"], name: "index_images_on_recipe_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.decimal  "price",                precision: 9, scale: 2
    t.string   "name"
    t.string   "quantity"
    t.integer  "recipe_id"
    t.string   "unit"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.integer  "user_id"
    t.string   "category"
    t.string   "ordering"
    t.decimal  "fat_percent"
    t.decimal  "water_percent"
    t.decimal  "sugar_percent"
    t.decimal  "kcal"
    t.decimal  "sugar_power"
    t.decimal  "alcool_percent"
    t.decimal  "dry_matter_percent"
    t.decimal  "cocoa_percent"
    t.decimal  "cocoa_butter_percent"
    t.decimal  "cocoa_total_percent"
    t.integer  "provider_id"
    t.boolean  "is_bio"
    t.boolean  "is_glut_free"
    t.integer  "stabilizer"
    t.boolean  "is_pulp",                                      default: false
    t.string   "brand"
    t.integer  "vat"
    t.integer  "weight"
    t.integer  "unit_quantity"
    t.integer  "unit_weight"
    t.integer  "protein"
    t.integer  "carbohydrates"
    t.integer  "salt"
  end

  add_index "ingredients", ["provider_id"], name: "index_ingredients_on_provider_id", using: :btree
  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id", using: :btree
  add_index "ingredients", ["user_id"], name: "index_ingredients_on_user_id", using: :btree

  create_table "measures", force: :cascade do |t|
    t.string   "name"
    t.integer  "weight"
    t.integer  "recipe_id"
    t.integer  "assembly_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "measures", ["assembly_id"], name: "index_measures_on_assembly_id", using: :btree
  add_index "measures", ["name"], name: "index_measures_on_name", using: :btree
  add_index "measures", ["recipe_id"], name: "index_measures_on_recipe_id", using: :btree

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

  create_table "provider_prices", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.decimal  "price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "provider_id"
  end

  add_index "provider_prices", ["ingredient_id"], name: "index_provider_prices_on_ingredient_id", using: :btree
  add_index "provider_prices", ["provider_id"], name: "index_provider_prices_on_provider_id", using: :btree

  create_table "providers", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "adress"
    t.string   "city"
    t.string   "postal"
    t.string   "country"
    t.string   "email"
    t.string   "website"
    t.string   "phone"
    t.string   "fax"
    t.string   "mobile_phone"
    t.string   "vat"
    t.string   "siret"
    t.text     "notes"
    t.integer  "user_id"
  end

  add_index "providers", ["ingredient_id"], name: "index_providers_on_ingredient_id", using: :btree
  add_index "providers", ["user_id"], name: "index_providers_on_user_id", using: :btree

  create_table "quantities", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.decimal  "quantity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "weight"
  end

  add_index "quantities", ["ingredient_id"], name: "index_quantities_on_ingredient_id", using: :btree
  add_index "quantities", ["recipe_id"], name: "index_quantities_on_recipe_id", using: :btree

  create_table "recipe_items", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "assembly_id"
    t.decimal  "total"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "recipe_items", ["assembly_id"], name: "index_recipe_items_on_assembly_id", using: :btree
  add_index "recipe_items", ["recipe_id"], name: "index_recipe_items_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "author"
    t.integer  "ingredient_id"
    t.string   "name"
    t.text     "description"
    t.text     "process"
    t.text     "note"
    t.text     "equipment"
    t.string   "category"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "step_id"
    t.string   "baking"
    t.string   "owner"
    t.boolean  "stared"
    t.decimal  "total"
    t.boolean  "loved"
    t.string   "portion"
    t.integer  "portion_weight"
    t.decimal  "portion_price"
    t.float    "vat"
    t.integer  "stock"
    t.integer  "to_produce"
    t.integer  "sold"
  end

  add_index "recipes", ["ingredient_id"], name: "index_recipes_on_ingredient_id", using: :btree
  add_index "recipes", ["step_id"], name: "index_recipes_on_step_id", using: :btree
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "steps", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "baking"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.string   "stripe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subscriptions", ["plan_id"], name: "index_subscriptions_on_plan_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.string   "due_date"
    t.string   "assigns_to"
    t.text     "details"
    t.integer  "to_do_list_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "done",          default: false
    t.integer  "priority"
  end

  add_index "tasks", ["to_do_list_id"], name: "index_tasks_on_to_do_list_id", using: :btree

  create_table "to_do_lists", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
    t.integer  "position"
    t.integer  "priority"
  end

  add_index "to_do_lists", ["user_id"], name: "index_to_do_lists_on_user_id", using: :btree

  create_table "totals", force: :cascade do |t|
    t.integer  "recipe_id"
    t.decimal  "value",       precision: 5, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "assembly_id"
  end

  add_index "totals", ["assembly_id"], name: "index_totals_on_assembly_id", using: :btree
  add_index "totals", ["recipe_id"], name: "index_totals_on_recipe_id", using: :btree

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
    t.string   "grade"
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
