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

ActiveRecord::Schema[7.0].define(version: 2022_07_12_164400) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "conclusions", force: :cascade do |t|
    t.string "conclusion_type"
    t.text "text"
    t.text "notes"
    t.integer "conclusion_id"
    t.integer "other_conclusion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "couplets", force: :cascade do |t|
    t.string "ref"
    t.integer "key_id"
    t.string "else_ref"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "ref"
    t.text "citation"
    t.string "language"
    t.text "original_file_url"
    t.text "archived_file_url"
    t.text "original_page_url"
    t.text "archived_page_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keys", force: :cascade do |t|
    t.string "ref"
    t.integer "document_id"
    t.text "title"
    t.string "language"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", force: :cascade do |t|
    t.integer "couplet_id"
    t.string "then_ref"
    t.integer "observation_id"
    t.integer "conclusion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observations", force: :cascade do |t|
    t.string "observation_type"
    t.text "text"
    t.text "notes"
    t.integer "observation_id"
    t.integer "other_observation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
