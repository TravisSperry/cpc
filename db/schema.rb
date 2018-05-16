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

ActiveRecord::Schema.define(version: 20180516005632) do

  create_table "activities", force: :cascade do |t|
    t.integer "trackable_id"
    t.string "trackable_type"
    t.integer "owner_id"
    t.string "owner_type"
    t.string "key"
    t.text "parameters"
    t.integer "recipient_id"
    t.string "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
  end

  create_table "boxes", force: :cascade do |t|
    t.integer "powder_id"
    t.integer "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "original_weight", default: 0
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "title"
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_contacts_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
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
    t.index ["primary_contact_id"], name: "index_customers_on_primary_contact_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.text "description"
    t.integer "quantity"
    t.text "notes"
    t.integer "work_order_id"
    t.integer "powder_id"
  end

  create_table "line_items_services", force: :cascade do |t|
    t.integer "line_item_id"
    t.integer "service_id"
    t.index ["line_item_id"], name: "index_line_items_services_on_line_item_id"
    t.index ["service_id"], name: "index_line_items_services_on_service_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.integer "notable_id"
    t.string "notable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable_type_and_notable_id"
  end

  create_table "powders", force: :cascade do |t|
    t.integer "manufacturer_id"
    t.integer "color_id"
    t.string "part_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.integer "weight", default: 0
    t.boolean "high_demand", default: false
    t.integer "reminder_weight", default: 1
    t.date "last_weight_reminder"
  end

  create_table "quality_assurance_approvals", force: :cascade do |t|
    t.integer "work_order_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quote_request_attachments", force: :cascade do |t|
    t.integer "quote_request_id"
    t.string "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quote_requests", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.string "status", default: "New", null: false
    t.string "source"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
  end

  create_table "services_work_orders", force: :cascade do |t|
    t.integer "service_id"
    t.integer "work_order_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "first_name"
    t.string "last_name"
    t.string "suffix"
    t.boolean "admin"
    t.boolean "can_approve_work_orders", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "work_orders", force: :cascade do |t|
    t.datetime "date_scheduled"
    t.datetime "date_due"
    t.datetime "date_completed"
    t.integer "customer_id"
    t.integer "contact_id"
    t.text "packaging_details"
    t.string "name"
    t.integer "marked_completed_by"
    t.integer "status"
    t.index ["contact_id"], name: "index_work_orders_on_contact_id"
    t.index ["customer_id"], name: "index_work_orders_on_customer_id"
  end

end
