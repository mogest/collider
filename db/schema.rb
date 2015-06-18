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

ActiveRecord::Schema.define(version: 20150618000344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atoms", force: :cascade do |t|
    t.integer  "account_id",         null: false
    t.integer  "element_id",         null: false
    t.integer  "parent_atom_id"
    t.integer  "number",             null: false
    t.integer  "created_by_user_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "atoms", ["account_id", "number"], name: "index_atoms_on_account_id_and_number", unique: true, using: :btree
  add_index "atoms", ["element_id"], name: "index_atoms_on_element_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "atom_id",    null: false
    t.text     "body",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["atom_id"], name: "index_comments_on_atom_id", using: :btree
  add_index "comments", ["created_at"], name: "index_comments_on_created_at", using: :btree

  create_table "element_fields", force: :cascade do |t|
    t.integer  "element_id", null: false
    t.integer  "field_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "element_fields", ["element_id"], name: "index_element_fields_on_element_id", using: :btree
  add_index "element_fields", ["field_id"], name: "index_element_fields_on_field_id", using: :btree

  create_table "elements", force: :cascade do |t|
    t.integer  "account_id", null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.integer  "account_id", null: false
    t.string   "name",       null: false
    t.string   "field_type", null: false
    t.string   "data_type",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fields", ["account_id"], name: "index_fields_on_account_id", using: :btree

  create_table "properties", force: :cascade do |t|
    t.integer  "atom_id",            null: false
    t.integer  "field_id",           null: false
    t.text     "text_value"
    t.integer  "integer_value"
    t.boolean  "boolean_value"
    t.datetime "datetime_value"
    t.integer  "parent_property_id"
    t.integer  "created_by_user_id"
    t.datetime "created_at",         null: false
    t.datetime "obsolete_at"
  end

  add_index "properties", ["atom_id", "field_id"], name: "index_properties_on_atom_id_and_field_id", unique: true, using: :btree
  add_index "properties", ["created_at"], name: "index_properties_on_created_at", using: :btree
  add_index "properties", ["created_by_user_id"], name: "index_properties_on_created_by_user_id", using: :btree
  add_index "properties", ["field_id"], name: "index_properties_on_field_id", using: :btree
  add_index "properties", ["obsolete_at"], name: "index_properties_on_obsolete_at", using: :btree
  add_index "properties", ["parent_property_id"], name: "index_properties_on_parent_property_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                          null: false
    t.string   "token",                          null: false
    t.string   "name",                           null: false
    t.string   "preferred_name",                 null: false
    t.boolean  "admin",          default: false, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "account_id",                     null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
