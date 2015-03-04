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

ActiveRecord::Schema.define(version: 20150304092222) do

  create_table "app_categories", id: false, force: true do |t|
    t.integer "application_id"
    t.integer "category_id"
  end

  create_table "app_installeds", force: true do |t|
    t.integer  "user_id"
    t.integer  "application_id"
    t.integer  "classroom_id",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "app_notifications", force: true do |t|
    t.integer  "application_id"
    t.text     "description"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applications", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.integer  "design_for"
    t.integer  "type"
    t.string   "teacher_url"
    t.string   "student_url"
    t.string   "parent_url"
    t.string   "help_url"
    t.string   "tem_url"
    t.string   "privacy_url"
    t.boolean  "is_free",                               default: true
    t.decimal  "price",        precision: 10, scale: 0, default: 0
    t.string   "website"
    t.string   "callback_url"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lms", force: true do |t|
    t.string   "name"
    t.string   "domain"
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paypal_notifications", force: true do |t|
    t.string   "txn_id"
    t.string   "txn_type"
    t.text     "params"
    t.string   "payer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "var",                           null: false
    t.text     "value",      limit: 2147483647
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "user_notifications", force: true do |t|
    t.integer  "paypal_notification_id"
    t.integer  "user_id"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_paypal_logs", force: true do |t|
    t.integer  "user_paypal_id"
    t.decimal  "amount",         precision: 10, scale: 0
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_paypals", force: true do |t|
    t.integer  "user_id"
    t.decimal  "balance",      precision: 10, scale: 0
    t.string   "email_paypal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
