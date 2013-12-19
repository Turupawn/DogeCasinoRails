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

ActiveRecord::Schema.define(version: 20131218235713) do

  create_table "bets", force: true do |t|
    t.string   "user"
    t.decimal  "bet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chests", force: true do |t|
    t.integer  "user_id"
    t.decimal  "price"
    t.decimal  "prize"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rolls", force: true do |t|
    t.integer  "user_id"
    t.decimal  "bet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "pass"
    t.string   "address"
    t.string   "deposit_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "withdraws", force: true do |t|
    t.integer  "user_id"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
