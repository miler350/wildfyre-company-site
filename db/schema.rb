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

ActiveRecord::Schema.define(version: 20130828015239) do

  create_table "comments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contacts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_first_name"
    t.string   "contact_middle_name"
    t.string   "contact_last_name"
    t.string   "contact_company"
    t.string   "contact_title"
    t.string   "contact_personal_email"
    t.string   "contact_work_email"
    t.string   "contact_cell_phone"
    t.string   "contact_work_phone"
    t.string   "contact_website"
    t.string   "contact_street_address"
    t.string   "contact_city"
    t.string   "contact_state"
    t.string   "contact_zip"
    t.string   "contact_country"
    t.string   "contact_linkedin"
    t.string   "contact_twitter"
    t.string   "contact_facebook"
    t.string   "contact_undergrad"
    t.string   "contact_undergrad_degree"
    t.string   "contact_grad"
    t.string   "contact_grad_degree"
    t.date     "contact_birthday"
    t.integer  "contact_married"
    t.integer  "contact_kids"
    t.integer  "user_id"
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "notes", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  create_table "photos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "user_id"
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "project_name"
    t.text     "project_description"
    t.string   "project_category"
    t.text     "project_special_requests"
    t.integer  "project_budget"
    t.text     "project_budget_explanation"
    t.string   "project_start"
    t.string   "project_git"
  end

  create_table "relationships", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  add_index "relationships", ["project_id"], name: "index_relationships_on_project_id", using: :btree
  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id", using: :btree

  create_table "uploads", force: true do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  add_index "uploads", ["project_id"], name: "index_uploads_on_project_id", using: :btree
  add_index "uploads", ["user_id"], name: "index_uploads_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "role"
    t.string   "title"
    t.string   "company"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "cell_phone"
    t.string   "work_phone"
    t.string   "website"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
