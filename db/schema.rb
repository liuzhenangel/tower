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

ActiveRecord::Schema.define(version: 20150907081956) do

  create_table "accesses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "resource_type"
    t.integer  "resource_id"
    t.integer  "project_id"
  end

  create_table "accesses_users", force: :cascade do |t|
    t.integer "access_id"
    t.integer "user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "todo_id"
    t.integer  "user_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "resource_object_id"
    t.string   "resource_object_type"
    t.string   "action"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "team_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "project_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "team_id"
  end

  create_table "projects_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  create_table "role_resources", force: :cascade do |t|
    t.integer  "access_id"
    t.string   "resource_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
  end

  create_table "todolists", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "project_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "end_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "todolist_id"
    t.string   "aasm_state"
    t.datetime "deleted_at"
  end

  add_index "todos", ["deleted_at"], name: "index_todos_on_deleted_at"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "logo"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
