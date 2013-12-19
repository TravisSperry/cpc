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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131219193711) do

  create_table "quotes", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "job_title"
    t.string   "company_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.string   "telephone"
    t.string   "fax"
    t.string   "part_number"
    t.string   "part_description"
    t.string   "powder_color"
    t.string   "powder_product_code"
    t.string   "powder_product_manufacturer"
    t.string   "part_size"
    t.string   "substrate"
    t.string   "coating_requirements"
    t.boolean  "paint_specs"
    t.string   "masking_requirements"
    t.string   "packaging_requirements"
    t.string   "quantity_year"
    t.string   "quantity_run"
    t.text     "note"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

end
