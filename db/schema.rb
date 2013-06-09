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

ActiveRecord::Schema.define(:version => 20130609092156) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "arxiv_url"
    t.date     "publication_date"
    t.integer  "num_citations"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "articles_authors", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "author_id"
  end

  add_index "articles_authors", ["article_id", "author_id"], :name => "index_articles_authors_on_article_id_and_author_id", :unique => true

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "census_counts", :force => true do |t|
    t.string   "area_id"
    t.integer  "male"
    t.integer  "female"
    t.integer  "totpop"
    t.integer  "tot16to74"
    t.integer  "totadult"
    t.integer  "totemploy"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "census_vars", :force => true do |t|
    t.integer  "VariableID"
    t.string   "VarLabel"
    t.string   "LongLabel"
    t.string   "Units"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clients", :id => false, :force => true do |t|
    t.integer "id",                  :null => false
    t.string  "name", :limit => 256
  end

  create_table "destinations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "trip_id"
  end

  create_table "dog", :force => true do |t|
    t.string "name",  :limit => 256
    t.text   "photo"
    t.string "breed", :limit => 256
  end

  create_table "moons", :force => true do |t|
    t.string   "name"
    t.integer  "planet_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "moons", ["planet_id"], :name => "index_moons_on_planet_id"

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "album_id"
  end

  create_table "planets", :force => true do |t|
    t.string   "name"
    t.text     "image"
    t.float    "orbit"
    t.float    "mass"
    t.float    "diameter"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stories", :force => true do |t|
    t.text     "title"
    t.text     "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "todo", :force => true do |t|
    t.string "item", :limit => 256
  end

  create_table "trips", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "video", :force => true do |t|
    t.string "title",       :limit => 256
    t.text   "description"
    t.text   "url"
    t.string "genre",       :limit => 256
  end

end
