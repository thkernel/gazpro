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

ActiveRecord::Schema.define(version: 2024_07_13_152421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "uid"
    t.string "login"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "accountable_type"
    t.bigint "accountable_id"
    t.bigint "role_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable"
    t.index ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_accounts_on_role_id"
    t.index ["unlock_token"], name: "index_accounts_on_unlock_token", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "social_reason"
    t.string "address"
    t.bigint "country_id"
    t.string "city"
    t.string "phone"
    t.string "po_box"
    t.string "postal_code"
    t.string "email"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_companies_on_account_id"
    t.index ["country_id"], name: "index_companies_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_countries_on_account_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "iso_code"
    t.string "symbol"
    t.string "decimal_symbol"
    t.string "symbol_position"
    t.string "thousand_separator"
    t.string "status"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_currencies_on_account_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "uid"
    t.string "company_name"
    t.string "first_name"
    t.string "last_name"
    t.string "civility"
    t.string "address"
    t.bigint "country_id"
    t.string "city"
    t.string "phone"
    t.string "street"
    t.string "po_box"
    t.string "zip_code"
    t.string "email"
    t.string "description"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_customers_on_account_id"
    t.index ["country_id"], name: "index_customers_on_country_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "subject_class"
    t.text "description"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "uid"
    t.datetime "order_date"
    t.bigint "customer_id", null: false
    t.string "transporter"
    t.string "delivery_note_number"
    t.float "entry_b3", default: 0.0
    t.float "entry_b6", default: 0.0
    t.float "entry_b12", default: 0.0
    t.float "entry_b32", default: 0.0
    t.float "entry_b38", default: 0.0
    t.float "out_b3", default: 0.0
    t.float "out_b6", default: 0.0
    t.float "out_b12", default: 0.0
    t.float "out_b32", default: 0.0
    t.float "out_b38", default: 0.0
    t.float "total_tonnage", default: 0.0
    t.string "status"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_orders_on_account_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "permission_items", force: :cascade do |t|
    t.string "uid"
    t.bigint "permission_id"
    t.string "action_name"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["permission_id"], name: "index_permission_items_on_permission_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "uid"
    t.bigint "feature_id"
    t.bigint "role_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feature_id"], name: "index_permissions_on_feature_id"
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "uid"
    t.string "slug"
    t.string "name"
    t.string "description"
    t.bigint "account_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_product_categories_on_account_id"
  end

  create_table "productions", force: :cascade do |t|
    t.string "uid"
    t.datetime "production_date"
    t.float "quantity", default: 0.0
    t.float "b3_number", default: 0.0
    t.float "b3_tonnage", default: 0.0
    t.float "b6_number", default: 0.0
    t.float "b6_tonnage", default: 0.0
    t.float "b12_number", default: 0.0
    t.float "b12_tonnage", default: 0.0
    t.float "b32_number", default: 0.0
    t.float "b32_tonnage", default: 0.0
    t.float "b38_number", default: 0.0
    t.float "b38_tonnage", default: 0.0
    t.float "total_tonnage", default: 0.0
    t.string "status"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_productions_on_account_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "uid"
    t.string "slug"
    t.bigint "product_category_id"
    t.string "name"
    t.bigint "unity_id"
    t.string "bar_code"
    t.float "unit_price", default: 0.0
    t.bigint "provider_id"
    t.float "reorder_threshold", default: 0.0
    t.float "current_stock", default: 0.0
    t.string "description"
    t.bigint "account_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_products_on_account_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["provider_id"], name: "index_products_on_provider_id"
    t.index ["unity_id"], name: "index_products_on_unity_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "uid"
    t.string "company_name"
    t.string "first_name"
    t.string "last_name"
    t.string "civility"
    t.string "address"
    t.bigint "country_id"
    t.string "city"
    t.string "phone"
    t.string "street"
    t.string "po_box"
    t.string "zip_code"
    t.string "email"
    t.string "description"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_providers_on_account_id"
    t.index ["country_id"], name: "index_providers_on_country_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "smtp_server_settings", force: :cascade do |t|
    t.string "uid"
    t.string "host"
    t.string "user_name"
    t.string "user_password"
    t.string "domain"
    t.string "address"
    t.integer "port"
    t.string "authentification"
    t.boolean "enable_starttls_auto"
    t.boolean "ssl"
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_smtp_server_settings_on_account_id"
  end

  create_table "stock_entries", force: :cascade do |t|
    t.string "uid"
    t.datetime "receipt_date"
    t.bigint "product_id", null: false
    t.string "delivery_note_number"
    t.bigint "tank_id", null: false
    t.string "driver"
    t.string "origin"
    t.float "quantity", default: 0.0
    t.bigint "unity_id", null: false
    t.text "description"
    t.string "status"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_stock_entries_on_account_id"
    t.index ["product_id"], name: "index_stock_entries_on_product_id"
    t.index ["tank_id"], name: "index_stock_entries_on_tank_id"
    t.index ["unity_id"], name: "index_stock_entries_on_unity_id"
  end

  create_table "tanks", force: :cascade do |t|
    t.string "uid"
    t.string "registration_number"
    t.string "brand"
    t.string "model"
    t.float "capacity", default: 0.0
    t.bigint "unity_id", null: false
    t.text "description"
    t.string "status"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_tanks_on_account_id"
    t.index ["unity_id"], name: "index_tanks_on_unity_id"
  end

  create_table "unities", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "unity_symbol"
    t.text "decription"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_unities_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "phone"
    t.text "description"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "accounts", "roles"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "companies", "accounts"
  add_foreign_key "companies", "countries"
  add_foreign_key "countries", "accounts"
  add_foreign_key "currencies", "accounts"
  add_foreign_key "customers", "accounts"
  add_foreign_key "customers", "countries"
  add_foreign_key "orders", "accounts"
  add_foreign_key "orders", "customers"
  add_foreign_key "permission_items", "permissions"
  add_foreign_key "permissions", "features"
  add_foreign_key "permissions", "roles"
  add_foreign_key "product_categories", "accounts"
  add_foreign_key "productions", "accounts"
  add_foreign_key "products", "accounts"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "providers"
  add_foreign_key "products", "unities"
  add_foreign_key "providers", "accounts"
  add_foreign_key "providers", "countries"
  add_foreign_key "smtp_server_settings", "accounts"
  add_foreign_key "stock_entries", "accounts"
  add_foreign_key "stock_entries", "products"
  add_foreign_key "stock_entries", "tanks"
  add_foreign_key "stock_entries", "unities"
  add_foreign_key "tanks", "accounts"
  add_foreign_key "tanks", "unities"
  add_foreign_key "unities", "accounts"
end
