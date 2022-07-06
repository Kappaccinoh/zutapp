# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_11_090515) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "black_and_white_animals_category_answers", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.text "answer"
    t.boolean "been_said", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_black_and_white_animals_category_answers_on_room_id"
  end

  create_table "famous_foursomes_category_answers", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.text "answer"
    t.boolean "been_said", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_famous_foursomes_category_answers_on_room_id"
  end

  create_table "game_turns", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.integer "room_players", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_game_turns_on_room_id"
    t.index ["user_id"], name: "index_game_turns_on_user_id"
  end

  create_table "groupparticipants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_groupparticipants_on_room_id"
    t.index ["user_id"], name: "index_groupparticipants_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.boolean "is_active", default: false
    t.string "category"
    t.string "game_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "black_and_white_animals_category_answers", "rooms"
  add_foreign_key "famous_foursomes_category_answers", "rooms"
  add_foreign_key "game_turns", "rooms"
  add_foreign_key "game_turns", "users"
  add_foreign_key "groupparticipants", "rooms"
  add_foreign_key "groupparticipants", "users"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "rooms", "users"
end
