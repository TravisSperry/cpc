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

ActiveRecord::Schema.define(version: 20171203180145) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id"
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "boxes", force: :cascade do |t|
    t.integer  "powder_id"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "original_weight", default: 0
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "phone"
    t.string  "email"
    t.string  "title"
    t.integer "customer_id"
  end

  add_index "contacts", ["customer_id"], name: "index_contacts_on_customer_id"

  create_table "customers", force: :cascade do |t|
    t.string  "name"
    t.string  "phone"
    t.string  "fax"
    t.string  "address1"
    t.string  "address2"
    t.string  "city"
    t.string  "state"
    t.string  "zip_code"
    t.integer "primary_contact_id"
    t.integer "account_type",       default: 0
    t.string  "email"
  end

  add_index "customers", ["primary_contact_id"], name: "index_customers_on_primary_contact_id"

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: :cascade do |t|
    t.text     "content",      limit: 255
    t.integer  "notable_id"
    t.string   "notable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "notes", ["notable_id", "notable_type"], name: "index_notes_on_notable_id_and_notable_type"

  create_table "powders", force: :cascade do |t|
    t.integer  "manufacturer_id"
    t.integer  "color_id"
    t.string   "part_number",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                 limit: 255
    t.integer  "weight",                           default: 0
    t.boolean  "high_demand",                      default: false
    t.integer  "reminder_weight",                  default: 1
    t.date     "last_weight_reminder"
  end

  create_table "quote_request_attachments", force: :cascade do |t|
    t.integer  "quote_request_id"
    t.string   "attachment",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "quote_requests" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "suffix",                 limit: 255
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  limit: 255,        null: false
    t.integer  "item_id",                       null: false
    t.string   "event",      limit: 255,        null: false
    t.string   "whodunnit",  limit: 255
    t.text     "object",     limit: 1073741823
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

  create_table "work_orders", force: :cascade do |t|
    t.datetime "date_scheduled"
    t.datetime "date_due"
    t.datetime "date_completed"
    t.datetime "date_in"
    t.datetime "date_out"
    t.integer  "customer_id"
    t.string   "name"
    t.integer  "primary_contact_id"
  end

end
