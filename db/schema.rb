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

ActiveRecord::Schema.define(version: 2018_07_04_165021) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "assignments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "cart_products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "product_id"
    t.integer "product_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_products_on_cart_id"
    t.index ["product_id"], name: "index_cart_products_on_product_id"
  end

  create_table "carts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "paid", default: false
    t.decimal "total", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "club_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "stars", precision: 2, scale: 1
    t.text "comment"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["product_id"], name: "index_product_reviews_on_product_id"
    t.index ["user_id"], name: "index_product_reviews_on_user_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "category_id"
    t.bigint "subcategory_id"
    t.string "sku"
    t.integer "stock"
    t.decimal "price", precision: 10, scale: 2
    t.integer "discount"
    t.integer "visits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id"
    t.integer "ventas"
    t.boolean "approved", default: false
    t.json "images"
    t.string "main_photo"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["store_id"], name: "index_products_on_store_id"
    t.index ["subcategory_id"], name: "index_products_on_subcategory_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "stars", precision: 2, scale: 1
    t.text "comment"
    t.bigint "store_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_store_reviews_on_store_id"
    t.index ["user_id"], name: "index_store_reviews_on_user_id"
  end

  create_table "stores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", null: false
    t.text "descripcion"
    t.string "slogan"
    t.string "fijo"
    t.string "celular"
    t.string "propietario"
    t.integer "ruc"
    t.string "calle_principal"
    t.string "calle_secundaria"
    t.string "sector"
    t.decimal "latitud", precision: 9, scale: 6
    t.decimal "longitud", precision: 9, scale: 6
    t.string "referencia"
    t.string "webpage_link"
    t.string "facebook_link"
    t.string "twitter_link"
    t.string "instagram_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "commission"
    t.bigint "category_id"
    t.bigint "subcategory_id"
    t.boolean "approved"
    t.string "cover"
    t.string "logo"
    t.string "ciudad"
    t.string "provincia"
    t.string "owner_photo"
    t.index ["category_id"], name: "index_stores_on_category_id"
    t.index ["subcategory_id"], name: "index_stores_on_subcategory_id"
  end

  create_table "subcategories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "user_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "club_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_card_id"], name: "index_user_cards_on_club_card_id"
    t.index ["user_id"], name: "index_user_cards_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "cedula", null: false
    t.string "nombres", null: false
    t.string "apellidos", null: false
    t.string "password_digest", null: false
    t.date "fecha_nacimiento"
    t.string "genero"
    t.string "barrio_sector"
    t.string "calle_principal"
    t.string "calle_secundaria"
    t.string "referencia"
    t.decimal "latitud", precision: 10
    t.decimal "longitud", precision: 10
    t.string "convencional"
    t.string "celular", default: "0", null: false
    t.string "empresa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "premium"
    t.string "avatar"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string "city"
    t.string "province"
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "assignments", "roles"
  add_foreign_key "assignments", "users"
  add_foreign_key "cart_products", "carts"
  add_foreign_key "cart_products", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "product_reviews", "products"
  add_foreign_key "product_reviews", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "stores"
  add_foreign_key "products", "subcategories"
  add_foreign_key "store_reviews", "stores"
  add_foreign_key "store_reviews", "users"
  add_foreign_key "stores", "categories"
  add_foreign_key "stores", "subcategories"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "user_cards", "club_cards"
  add_foreign_key "user_cards", "users"
end
