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

ActiveRecord::Schema.define(version: 2018_12_19_002841) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attribute_choices", force: :cascade do |t|
    t.integer "product_attribute_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_attribute_id"], name: "index_attribute_choices_on_product_attribute_id"
  end

  create_table "attribute_choices_variants", id: false, force: :cascade do |t|
    t.integer "attribute_choice_id", null: false
    t.integer "variant_id", null: false
    t.index ["attribute_choice_id"], name: "index_attribute_choices_variants_on_attribute_choice_id"
    t.index ["variant_id"], name: "index_attribute_choices_variants_on_variant_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer "simple_notification_id"
    t.string "receiver_type"
    t.integer "receiver_id"
    t.boolean "is_delivered", default: false
    t.boolean "is_read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_delivered"], name: "index_deliveries_on_is_delivered"
    t.index ["receiver_type", "receiver_id"], name: "index_deliveries_on_receiver_type_and_receiver_id"
    t.index ["simple_notification_id"], name: "index_deliveries_on_simple_notification_id"
    t.index [nil, nil], name: "index_deliveries_on_sender_id_and_sender_type"
  end

  create_table "product_attributes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_attributes_classes", id: false, force: :cascade do |t|
    t.integer "product_attribute_id", null: false
    t.integer "product_class_id", null: false
    t.index ["product_attribute_id"], name: "index_product_attributes_classes_on_product_attribute_id"
    t.index ["product_class_id"], name: "index_product_attributes_classes_on_product_class_id"
  end

  create_table "product_classes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "product_class_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_class_id"], name: "index_products_on_product_class_id"
  end

  create_table "simple_notifications", force: :cascade do |t|
    t.string "sender_type"
    t.integer "sender_id"
    t.string "entity_type"
    t.integer "entity_id"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id", "entity_type"], name: "index_simple_notifications_on_entity_id_and_entity_type"
    t.index ["entity_type", "entity_id"], name: "index_simple_notifications_on_entity_type_and_entity_id"
    t.index ["sender_id", "sender_type"], name: "index_simple_notifications_on_sender_id_and_sender_type"
    t.index ["sender_type", "sender_id"], name: "index_simple_notifications_on_sender_type_and_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "variants", force: :cascade do |t|
    t.integer "product_id"
    t.string "name"
    t.string "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

end
