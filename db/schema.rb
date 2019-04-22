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

ActiveRecord::Schema.define(version: 2019_04_18_220013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_stats", force: :cascade do |t|
    t.bigint "schedule_id"
    t.index ["schedule_id"], name: "index_game_stats_on_schedule_id"
  end

  create_table "player_stats", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "games_played", default: 0
    t.integer "bat_innings", default: 0
    t.integer "not_outs", default: 0
    t.integer "bat_runs", default: 0
    t.integer "high_score", default: 0
    t.integer "balls_faced", default: 0
    t.integer "hundreds", default: 0
    t.integer "fifties", default: 0
    t.integer "fours", default: 0
    t.integer "sixes", default: 0
    t.integer "catches", default: 0
    t.integer "run_outs", default: 0
    t.integer "stumpings", default: 0
    t.integer "bowl_innings", default: 0
    t.integer "balls_bowled", default: 0
    t.integer "bowl_runs", default: 0
    t.integer "wickets", default: 0
    t.string "best_bowling", default: "0/0"
    t.index ["user_id"], name: "index_player_stats_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.date "date"
    t.time "start_time", default: "2000-01-01 10:45:00"
    t.string "opponent"
    t.integer "series_game"
    t.boolean "completed", default: false
    t.string "location", default: "Piper Park, Larkspur"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "selections", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_selections_on_schedule_id"
    t.index ["user_id"], name: "index_selections_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.string "bats"
    t.string "bowls"
    t.boolean "paid", default: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
  end

end
