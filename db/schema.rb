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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120803070020) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "links", :force => true do |t|
    t.text     "title"
    t.text     "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "node_id"
  end

  create_table "nodes", :force => true do |t|
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "name"
    t.integer  "category_id"
    t.string   "slug"
    t.string   "tags"
    t.integer  "hotness"
  end

  add_index "nodes", ["slug"], :name => "index_nodes_on_slug"

  create_table "nodes_nodes", :id => false, :force => true do |t|
    t.integer "from_id"
    t.integer "to_id"
  end

  add_index "nodes_nodes", ["from_id"], :name => "index_nodes_nodes_on_from_id"
  add_index "nodes_nodes", ["to_id"], :name => "index_nodes_nodes_on_to_id"

end
