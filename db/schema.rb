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

ActiveRecord::Schema.define(version: 20151213205110) do

  create_table "game_play_roles", force: :cascade do |t|
    t.integer  "game_play_id"
    t.integer  "game_role_id"
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "won"
  end

  add_index "game_play_roles", ["game_play_id"], name: "index_game_play_roles_on_game_play_id"
  add_index "game_play_roles", ["game_role_id"], name: "index_game_play_roles_on_game_role_id"
  add_index "game_play_roles", ["user_id"], name: "index_game_play_roles_on_user_id"

# Could not dump table "game_plays" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "game_roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "game_roles", ["game_id"], name: "index_game_roles_on_game_id"

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "games", ["name"], name: "index_games_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "admin"
  end

  create_table "win_conditions", force: :cascade do |t|
    t.string   "name"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "win_conditions", ["game_id"], name: "index_win_conditions_on_game_id"

end
