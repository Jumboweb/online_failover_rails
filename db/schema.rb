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

ActiveRecord::Schema.define(version: 20150102094705) do

  create_table "addresses", force: :cascade do |t|
    t.string   "address"
    t.integer  "port"
    t.integer  "failed_ping"
    t.integer  "failover_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "addresses", ["failover_id"], name: "index_addresses_on_failover_id"

  create_table "failovers", force: :cascade do |t|
    t.string   "ip"
    t.string   "name"
    t.integer  "master_server_id"
    t.integer  "backup_server_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "state"
  end

  add_index "failovers", ["backup_server_id"], name: "index_failovers_on_backup_server_id"
  add_index "failovers", ["master_server_id"], name: "index_failovers_on_master_server_id"

  create_table "servers", force: :cascade do |t|
    t.integer  "online_id"
    t.string   "ip"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
