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

ActiveRecord::Schema.define(version: 20151019064719) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",                  null: false
    t.string   "resource_type",                null: false
    t.integer  "author_id",     precision: 38
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "i_act_adm_com_aut_typ_aut_id"
  add_index "active_admin_comments", ["namespace"], name: "i_act_adm_com_nam"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "i_act_adm_com_res_typ_res_id"

  create_table "cdjg", id: false, force: :cascade do |t|
    t.string "xmdm", limit: 6
    t.string "xmmc", limit: 20
    t.string "jyjb", limit: 16
    t.string "cddm", limit: 6
    t.string "zcd",  limit: 6
    t.string "clcx", limit: 30
    t.string "jydm", limit: 6
    t.string "id",   limit: 20
  end

  create_table "hmdy", id: false, force: :cascade do |t|
    t.string  "hmdm", limit: 7,                 null: false
    t.string  "hmmc", limit: 40
    t.string  "hmbt", limit: 40
    t.integer "qsh",             precision: 38
    t.integer "qsl",             precision: 38
    t.integer "hs",              precision: 38
    t.integer "ls",              precision: 38
    t.string  "bklx", limit: 1
    t.string  "xhgb", limit: 1
  end

  create_table "hmzd", id: false, force: :cascade do |t|
    t.string  "hmdm",    limit: 7,                   null: false
    t.integer "zdxh",                 precision: 38, null: false
    t.string  "zdbt",    limit: 70
    t.string  "tsxx",    limit: 70
    t.string  "xssx",    limit: 3
    t.string  "zdlx",    limit: 1
    t.string  "sjbm",    limit: 32
    t.string  "sjlx",    limit: 1
    t.integer "zdcd",                 precision: 38
    t.integer "xsws",                 precision: 38
    t.integer "qsh",                  precision: 38
    t.integer "qsl",                  precision: 38
    t.string  "czfs",    limit: 1
    t.string  "xxdm",    limit: 6
    t.string  "xxzb",    limit: 32
    t.string  "czbz",    limit: 1
    t.string  "cz",      limit: 70
    t.string  "kzbz",    limit: 1
    t.string  "qzfw",    limit: 70
    t.string  "qrbz",    limit: 1
    t.string  "srsb",    limit: 2
    t.string  "bz",      limit: 8
    t.string  "mmzh",    limit: 40
    t.string  "zdjydm",  limit: 6
    t.string  "zdjyrk",  limit: 1024
    t.string  "zdjyck",  limit: 1024
    t.string  "zdqdtj",  limit: 254
    t.string  "jrtj",    limit: 254
    t.string  "lktj",    limit: 270
    t.string  "fhtj",    limit: 254
    t.string  "lkzx",    limit: 254
    t.integer "x",                    precision: 38
    t.integer "y",                    precision: 38
    t.integer "w",                    precision: 38
    t.integer "h",                    precision: 38
    t.integer "r",                    precision: 38
    t.integer "c",                    precision: 38
    t.integer "colspan",              precision: 38
    t.string  "cxjydm",  limit: 6
    t.string  "cxqdtj",  limit: 254
    t.string  "cxjyrk",  limit: 1024
    t.string  "cxxsbt",  limit: 50
    t.string  "cxxsid",  limit: 10
  end

  create_table "jyld", id: false, force: :cascade do |t|
    t.string  "jydm",   limit: 6,                   null: false
    t.integer "xh",                  precision: 38, null: false
    t.string  "zjym",   limit: 6,                   null: false
    t.string  "jymc",   limit: 30
    t.string  "ldbs",   limit: 2,                   null: false
    t.string  "qzbs",   limit: 2
    t.string  "qdtj",   limit: 254
    t.string  "rksj",   limit: 4000
    t.string  "ldsx",   limit: 10
    t.string  "tjlx",   limit: 1
    t.string  "swbz",   limit: 2
    t.string  "jylx",   limit: 2
    t.string  "jytj",   limit: 254
    t.string  "bljglb", limit: 6
    t.string  "bljs",   limit: 10
  end

  create_table "jyzb", id: false, force: :cascade do |t|
    t.string "jydm",   limit: 6
    t.string "jymc",   limit: 30
    t.string "srpmh1", limit: 7
    t.string "srpmh2", limit: 7
    t.string "srpmh3", limit: 7
    t.string "srpmh4", limit: 7
    t.string "srpmh5", limit: 7
    t.string "srpmh6", limit: 7
    t.string "srpmh7", limit: 7
    t.string "srpmh8", limit: 7
    t.string "xypmh",  limit: 7
    t.string "fhpmh",  limit: 7
    t.string "tjlx",   limit: 1
    t.string "bbh",    limit: 11
    t.string "cldm",   limit: 6
    t.string "fhlx",   limit: 1
    t.string "jysx",   limit: 2
    t.string "ldlcbz", limit: 1
  end

  create_table "jyzd", id: false, force: :cascade do |t|
    t.string "jydm", limit: 6,  null: false
    t.string "sjbm", limit: 32, null: false
    t.string "csbz", limit: 1,  null: false
  end

  create_table "sjzd", id: false, force: :cascade do |t|
    t.string  "sjbm", limit: 32,                null: false
    t.string  "sjlx", limit: 1,                 null: false
    t.integer "sjcd",            precision: 38, null: false
    t.integer "xsws",            precision: 38, null: false
    t.string  "sjmc", limit: 40,                null: false
    t.string  "bz",   limit: 1,                 null: false
  end

end
