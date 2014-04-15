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

ActiveRecord::Schema.define(version: 20140410014911) do

  create_table "games", force: true do |t|
    t.integer  "match_id"
    t.integer  "game_number"
    t.integer  "a_score"
    t.integer  "b_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["game_number"], name: "index_games_on_game_number", using: :btree
  add_index "games", ["match_id", "game_number"], name: "index_games_on_match_id_and_game_number", unique: true, using: :btree
  add_index "games", ["match_id"], name: "index_games_on_match_id", using: :btree

  create_table "matches", force: true do |t|
    t.string   "a_first_name"
    t.string   "a_last_name"
    t.string   "a_country"
    t.string   "b_first_name"
    t.string   "b_last_name"
    t.string   "b_country"
    t.boolean  "is_running",    default: false
    t.boolean  "is_over",       default: false
    t.integer  "table_id"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.boolean  "a_red_card",    default: false
    t.boolean  "a_yellow_card", default: false
    t.boolean  "a_timeout",     default: false
    t.boolean  "b_red_card",    default: false
    t.boolean  "b_yellow_card", default: false
    t.boolean  "b_timeout",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "left_side"
    t.string   "right_side"
    t.string   "server"
    t.integer  "a_score",       default: 0
    t.integer  "b_score",       default: 0
  end

  add_index "matches", ["is_over"], name: "index_matches_on_is_over", using: :btree
  add_index "matches", ["is_running"], name: "index_matches_on_is_running", using: :btree
  add_index "matches", ["table_id"], name: "index_matches_on_table_id", using: :btree

  create_table "tables", force: true do |t|
    t.string   "name"
    t.boolean  "reverse_ends", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
