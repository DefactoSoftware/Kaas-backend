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

ActiveRecord::Schema.define(version: 20131121181726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  create_table "points", force: true do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.text     "question"
    t.integer  "user_answer_id"
    t.text     "answer"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time_limit"
  end

  create_table "requests", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "time_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["question_id", "user_id"], name: "index_requests_on_question_id_and_user_id", unique: true, using: :btree

  create_table "user_categories", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_categories", ["category_id", "user_id"], name: "index_user_categories_on_category_id_and_user_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
