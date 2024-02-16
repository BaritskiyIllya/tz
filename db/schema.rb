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

ActiveRecord::Schema.define(version: 2024_02_15_221858) do

  create_table "device_experiments", force: :cascade do |t|
    t.integer "device_id", null: false
    t.integer "experiments_option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_device_experiments_on_device_id"
    t.index ["experiments_option_id"], name: "index_device_experiments_on_experiments_option_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "experiments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "experiments_options", force: :cascade do |t|
    t.integer "experiment_id", null: false
    t.json "options"
    t.float "max_percentage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["experiment_id"], name: "index_experiments_options_on_experiment_id"
  end

  add_foreign_key "device_experiments", "devices"
  add_foreign_key "device_experiments", "experiments_options"
  add_foreign_key "experiments_options", "experiments"
end