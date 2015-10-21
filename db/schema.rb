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

ActiveRecord::Schema.define(version: 20151021083249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string   "candidate_name"
    t.string   "candidate_email"
    t.string   "candidate_phone"
    t.text     "candidate_about"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "vacancy_id"
  end

  create_table "internusrs", force: :cascade do |t|
    t.string   "intern_name"
    t.text     "intern_about"
    t.string   "intern_email"
    t.string   "intern_phone"
    t.string   "intern_salary"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "internusrs_tags", id: false, force: :cascade do |t|
    t.integer "internusr_id"
    t.integer "tag_id"
  end

  add_index "internusrs_tags", ["internusr_id", "tag_id"], name: "index_internusrs_tags_on_internusr_id_and_tag_id", using: :btree
  add_index "internusrs_tags", ["internusr_id"], name: "index_internusrs_tags_on_internusr_id", using: :btree

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
    t.integer  "vacancytype_id"
  end

end
