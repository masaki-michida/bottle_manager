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

ActiveRecord::Schema.define(version: 2020_07_10_082944) do

  create_table "bottles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "local_number", null: false
    t.bigint "kind_of_alchol_id", null: false
    t.integer "liquid_level"
    t.integer "karaoke"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kind_of_alchol_id"], name: "fk_rails_7576985a0f"
    t.index ["status"], name: "index_bottles_on_status"
  end

  create_table "customer_bottles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "bottle_id"
    t.index ["bottle_id"], name: "fk_rails_90de96fe30"
    t.index ["customer_id"], name: "fk_rails_ab91a38c14"
  end

  create_table "customer_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "group_id"
    t.index ["customer_id"], name: "fk_rails_653ecd0dfb"
    t.index ["group_id"], name: "fk_rails_95544ad2a2"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "local_number"
    t.string "name"
    t.integer "karaoke_customer"
    t.integer "status"
    t.datetime "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status"], name: "index_customers_on_status"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "kind_of_alchols", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "nicknames", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_nicknames_on_customer_id"
  end

  add_foreign_key "bottles", "kind_of_alchols"
  add_foreign_key "customer_bottles", "bottles"
  add_foreign_key "customer_bottles", "customers"
  add_foreign_key "customer_groups", "customers"
  add_foreign_key "customer_groups", "groups"
  add_foreign_key "nicknames", "customers"
end
