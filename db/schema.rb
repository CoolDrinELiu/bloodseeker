# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_24_132911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coins", force: :cascade do |t|
    t.string "name"
    t.float "days_left"
    t.float "annual_rate"
    t.float "landed_rate"
    t.float "gap_rate"
    t.decimal "future_price"
    t.decimal "spot_price"
    t.integer "birth_mark"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["birth_mark"], name: "index_coins_on_birth_mark"
    t.index ["created_at", "days_left"], name: "index_coins_on_created_at_and_days_left"
    t.index ["days_left"], name: "index_coins_on_days_left"
    t.index ["name"], name: "index_coins_on_name"
  end

end
