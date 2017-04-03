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

ActiveRecord::Schema.define(version: 20170403165858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string   "name"
    t.decimal  "abv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "postcode"
    t.string   "phone"
    t.string   "email"
  end

  create_table "job_logs", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "log_type"
    t.date     "log_date"
    t.string   "stime"
    t.date     "datebi"
    t.string   "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_logs_on_job_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "jobdesc"
    t.decimal  "price"
    t.date     "sdate"
    t.string   "stime"
    t.date     "datebi"
    t.string   "crew"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "recstatus"
    t.string   "notes"
    t.index ["client_id"], name: "index_jobs_on_client_id", using: :btree
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "client_id"
    t.decimal  "w1"
    t.decimal  "eh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_prices_on_client_id", using: :btree
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "tran_type"
    t.string   "tran_method"
    t.decimal  "amount"
    t.date     "tran_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["job_id"], name: "index_transactions_on_job_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "job_logs", "jobs"
  add_foreign_key "jobs", "clients"
  add_foreign_key "prices", "clients"
  add_foreign_key "transactions", "jobs"
end
