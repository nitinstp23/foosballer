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

ActiveRecord::Schema.define(version: 20140707200041) do

  create_table "game_sessions", force: true do |t|
    t.integer  "player_id",  null: false
    t.integer  "team_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_sessions", ["player_id", "team_id"], name: "index_game_sessions_on_player_id_and_team_id", unique: true

  create_table "players", force: true do |t|
    t.string   "first_name", null: false
    t.string   "last_name"
    t.string   "email",      null: false
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name",          null: false
    t.integer  "tournament_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["tournament_id"], name: "index_teams_on_tournament_id"

  create_table "tournaments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
