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

ActiveRecord::Schema.define(version: 20151016192901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tags", force: :cascade do |t|
    t.string   "tag_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_vacancies", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "vacancy_id"
  end

  add_index "tags_vacancies", ["tag_id", "vacancy_id"], name: "index_tags_vacancies_on_tag_id_and_vacancy_id", using: :btree
  add_index "tags_vacancies", ["vacancy_id"], name: "index_tags_vacancies_on_vacancy_id", using: :btree

  create_table "vacancies", force: :cascade do |t|
    t.string   "vacancy_company_name"
    t.string   "vacancy_title"
    t.text     "vacancy_description"
    t.text     "vacancy_instructions"
    t.string   "vacancy_url"
    t.string   "vacancy_salary"
    t.string   "vacancy_company_email"
    t.string   "vacancy_company_logo"
    t.string   "vacancy_company_url"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.boolean  "vacancy_status"
  end

end
