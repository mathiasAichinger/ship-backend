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

ActiveRecord::Schema.define(version: 20160221133320) do

  create_table "action_templates", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "icon_url"
    t.integer  "action_templates_id"
    t.integer  "parent_id"
  end

  add_index "action_templates", ["action_templates_id"], name: "index_action_templates_on_action_templates_id"
  add_index "action_templates", ["parent_id"], name: "index_action_templates_on_parent_id"

  create_table "action_templates_lane_templates", id: false, force: :cascade do |t|
    t.integer "lane_template_id"
    t.integer "action_template_id"
  end

  add_index "action_templates_lane_templates", ["action_template_id"], name: "at"
  add_index "action_templates_lane_templates", ["lane_template_id", "action_template_id"], name: "lt_at"

  create_table "actions", force: :cascade do |t|
    t.float    "progress"
    t.string   "status"
    t.string   "logs"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "lane_id"
    t.integer  "action_template_id"
  end

  add_index "actions", ["lane_id"], name: "index_actions_on_lane_id"

  create_table "apps", force: :cascade do |t|
    t.string   "key"
    t.string   "name"
    t.string   "description"
    t.string   "icon_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "apps_lane_templates", force: :cascade do |t|
    t.integer "app_id"
    t.integer "lane_template_id"
  end

  add_index "apps_lane_templates", ["lane_template_id", "app_id"], name: "lt_a"
  add_index "apps_lane_templates", ["lane_template_id"], name: "lt"

  create_table "builds", force: :cascade do |t|
    t.string   "name"
    t.string   "status"
    t.float    "progress"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "app_id"
  end

  add_index "builds", ["app_id"], name: "index_builds_on_app_id"

  create_table "lane_templates", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "root_action_template_id"
  end

  create_table "lanes", force: :cascade do |t|
    t.float    "progress"
    t.datetime "startDate"
    t.datetime "endDate"
    t.string   "logs"
    t.string   "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "build_id"
    t.integer  "lane_template_id"
  end

  add_index "lanes", ["build_id"], name: "index_lanes_on_build_id"

end
