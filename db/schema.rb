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

ActiveRecord::Schema.define(version: 20161119181436) do

  create_table "character_attributes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "character_skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "character_attribute_id"
    t.text     "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.integer  "agility"
    t.integer  "smarts"
    t.integer  "spirit"
    t.integer  "strength"
    t.integer  "vigor"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "skills"
    t.integer  "creation_points", default: 25
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
