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

ActiveRecord::Schema.define(version: 2019_12_04_021928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", id: :serial, force: :cascade do |t|
    t.string "trackable_type"
    t.integer "trackable_id"
    t.string "owner_type"
    t.integer "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["owner_type", "owner_id"], name: "index_activities_on_owner_type_and_owner_id"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["recipient_type", "recipient_id"], name: "index_activities_on_recipient_type_and_recipient_id"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
  end

  create_table "boxes", id: :serial, force: :cascade do |t|
    t.integer "powder_id"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "original_weight", default: 0
  end

  create_table "colors", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "title"
    t.integer "customer_id"
    t.bigint "contact_type_id"
    t.index ["contact_type_id"], name: "index_contacts_on_contact_type_id"
    t.index ["customer_id"], name: "index_contacts_on_customer_id"
  end

  create_table "customers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "fax"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.integer "primary_contact_id"
    t.integer "account_type", default: 0
    t.string "email"
    t.string "attachments", default: [], array: true
    t.boolean "can_have_users"
    t.index ["primary_contact_id"], name: "index_customers_on_primary_contact_id"
  end

  create_table "customers_users", id: false, force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "user_id", null: false
    t.index ["customer_id", "user_id"], name: "index_customers_users_on_customer_id_and_user_id"
  end

  create_table "line_items", id: :serial, force: :cascade do |t|
    t.text "description"
    t.integer "quantity"
    t.text "notes"
    t.integer "work_order_id"
    t.integer "powder_id"
  end

  create_table "line_items_services", force: :cascade do |t|
    t.bigint "line_item_id"
    t.bigint "service_id"
    t.index ["line_item_id"], name: "index_line_items_services_on_line_item_id"
    t.index ["service_id"], name: "index_line_items_services_on_service_id"
  end

  create_table "manufacturers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", id: :serial, force: :cascade do |t|
    t.text "content"
    t.string "notable_type"
    t.integer "notable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable_type_and_notable_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "sku"
    t.string "label"
    t.text "description"
    t.bigint "customer_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachments", default: [], array: true
    t.index ["customer_id"], name: "index_parts_on_customer_id"
  end

  create_table "powders", id: :serial, force: :cascade do |t|
    t.integer "manufacturer_id"
    t.integer "color_id"
    t.string "part_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "weight", default: 0
    t.boolean "high_demand", default: false
    t.integer "reminder_weight", default: 1
    t.date "last_weight_reminder"
  end

  create_table "production_stages", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quality_assurance_approvals", force: :cascade do |t|
    t.integer "work_order_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quote_request_attachments", id: :serial, force: :cascade do |t|
    t.integer "quote_request_id"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quote_requests", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "job_title"
    t.string "company_name"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "email"
    t.string "telephone"
    t.string "fax"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "status", default: "New", null: false
    t.string "source"
  end

  create_table "service_schedules", force: :cascade do |t|
    t.bigint "work_order_schedule_id"
    t.bigint "service_id"
    t.date "start_date"
    t.date "end_date"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_service_schedules_on_service_id"
    t.index ["work_order_schedule_id"], name: "index_service_schedules_on_work_order_schedule_id"
  end

  create_table "service_trackings", force: :cascade do |t|
    t.bigint "work_order_id"
    t.bigint "tracking_entries_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tracking_entries_id"], name: "index_service_trackings_on_tracking_entries_id"
    t.index ["work_order_id"], name: "index_service_trackings_on_work_order_id"
  end

  create_table "services", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "services_work_orders", id: :serial, force: :cascade do |t|
    t.integer "service_id"
    t.integer "work_order_id"
    t.index ["service_id"], name: "index_services_work_orders_on_service_id"
    t.index ["work_order_id"], name: "index_services_work_orders_on_work_order_id"
  end

  create_table "tracking_entries", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "deleted_at"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_tracking_entries_on_service_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "suffix"
    t.boolean "admin"
    t.boolean "can_approve_work_orders", default: false
    t.datetime "deleted_at"
    t.bigint "user_type_id"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  create_table "versions", id: :serial, force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "work_order_schedules", force: :cascade do |t|
    t.bigint "work_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_order_id"], name: "index_work_order_schedules_on_work_order_id"
  end

  create_table "work_orders", id: :serial, force: :cascade do |t|
    t.datetime "date_scheduled"
    t.datetime "date_due"
    t.datetime "date_completed"
    t.integer "customer_id"
    t.integer "contact_id"
    t.text "packaging_details"
    t.string "name"
    t.integer "marked_completed_by"
    t.integer "status"
    t.integer "production_stage_id"
    t.string "estimated_price"
    t.string "attachments", default: [], array: true
    t.index ["contact_id"], name: "index_work_orders_on_contact_id"
    t.index ["customer_id"], name: "index_work_orders_on_customer_id"
  end

  add_foreign_key "contacts", "contact_types"
  add_foreign_key "contacts", "customers"
  add_foreign_key "parts", "customers"
  add_foreign_key "service_schedules", "services"
  add_foreign_key "service_schedules", "work_order_schedules"
  add_foreign_key "service_trackings", "tracking_entries", column: "tracking_entries_id"
  add_foreign_key "service_trackings", "work_orders"
  add_foreign_key "tracking_entries", "services"
  add_foreign_key "users", "user_types"
  add_foreign_key "work_order_schedules", "work_orders"
  add_foreign_key "work_orders", "contacts"
  add_foreign_key "work_orders", "customers"
end
