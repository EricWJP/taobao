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

ActiveRecord::Schema.define(version: 20161130083450) do

  create_table "coupo", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "author_name"
    t.text     "body",               limit: 4294967295
    t.string   "link"
    t.string   "summary",            limit: 1000
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.integer  "comments_count",                        default: 0
    t.integer  "praises_count",                         default: 0
    t.integer  "visits_count",                          default: 0
    t.datetime "published_at"
    t.integer  "kr36_id"
    t.integer  "position"
    t.string   "status"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "coupons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "taobao_id"
    t.string   "name"
    t.string   "cover_url"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "detail_url"
    t.string   "type"
    t.string   "taobao_url"
    t.float    "price",              limit: 24
    t.integer  "monthsales"
    t.float    "income_rate",        limit: 24
    t.float    "commission",         limit: 24
    t.string   "seller_ww"
    t.string   "seller_id"
    t.string   "seller_name"
    t.string   "seller_type"
    t.string   "coupon_id"
    t.integer  "coupon_total"
    t.integer  "coupon_remainder"
    t.string   "coupon_detail"
    t.date     "coupon_start_date"
    t.date     "coupon_end_date"
    t.string   "coupon_url"
    t.string   "coupon_spread_url"
    t.integer  "position"
    t.string   "status"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["coupon_id"], name: "index_coupons_on_coupon_id", using: :btree
    t.index ["seller_id"], name: "index_coupons_on_seller_id", using: :btree
    t.index ["taobao_id"], name: "index_coupons_on_taobao_id", using: :btree
  end

end
