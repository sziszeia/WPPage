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

ActiveRecord::Schema.define(version: 2019_11_21_213113) do

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.decimal "total"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "countryCode"
    t.string "region"
    t.string "incomeGroup"
    t.string "specialNotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "indicators", force: :cascade do |t|
    t.string "indicator_code"
    t.string "indicator_name"
    t.string "source_note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date "orderDate"
    t.date "deliveryDate"
    t.boolean "isComplete"
    t.string "status"
    t.boolean "isCancelled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "populations", force: :cascade do |t|
    t.integer "country_id"
    t.integer "indicator_id"
    t.decimal "Y2000"
    t.decimal "Y2001"
    t.decimal "Y2002"
    t.decimal "Y2003"
    t.decimal "Y2004"
    t.decimal "Y2005"
    t.decimal "Y2006"
    t.decimal "Y2007"
    t.decimal "Y2008"
    t.decimal "Y2009"
    t.decimal "Y2010"
    t.decimal "Y2011"
    t.decimal "Y2012"
    t.decimal "Y2013"
    t.decimal "Y2014"
    t.decimal "Y2015"
    t.decimal "Y2016"
    t.decimal "Y2017"
    t.decimal "Y2018"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_populations_on_country_id"
    t.index ["indicator_id"], name: "index_populations_on_indicator_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "pic"
    t.decimal "price"
    t.integer "quantity"
    t.boolean "isNew"
    t.boolean "isDiscounted"
    t.string "type"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "userName"
    t.string "password"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
