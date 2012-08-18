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

ActiveRecord::Schema.define(:version => 20120818205752) do

  create_table "albums", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "album_file_name"
    t.string   "album_content_type"
    t.string   "album_file_size"
    t.string   "album_cover_file_name"
    t.string   "album_cover_content_type"
    t.string   "album_cover_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",        :default => "", :null => false
    t.string   "last_name",         :default => "", :null => false
    t.string   "display_name",      :default => "", :null => false
    t.string   "email",             :default => "", :null => false
    t.string   "crypted_password",  :default => "", :null => false
    t.string   "password_salt",     :default => "", :null => false
    t.string   "persistence_token", :default => "", :null => false
    t.string   "perishable_token",  :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true

end
