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

ActiveRecord::Schema.define(:version => 20130826003624) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "language_tables", :force => true do |t|
    t.integer  "language_id"
    t.integer  "theme_id"
    t.integer  "subtheme_id"
    t.integer  "word_id"
    t.string   "theme"
    t.string   "theme_image"
    t.string   "theme_pdf"
    t.string   "theme_description"
    t.string   "subtheme"
    t.string   "subtheme_pdf_flashcards"
    t.string   "subtheme_pdf_worksheet"
    t.string   "subtheme_image"
    t.string   "subtheme_description"
    t.string   "word"
    t.string   "word_image"
    t.string   "word_audio"
    t.string   "word_pdf"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "languages", :force => true do |t|
    t.string   "name_english"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "subthemes", :force => true do |t|
    t.string   "pdf_flashcards"
    t.string   "pdf_worksheet"
    t.string   "image"
    t.string   "name_english"
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "description"
    t.string   "video_url"
    t.string   "theme_id"
  end

  create_table "subthemes_words", :force => true do |t|
    t.integer  "word_id"
    t.integer  "subtheme_id"
    t.string   "word_english"
    t.string   "word_foreign"
    t.string   "word_foreign_image"
    t.string   "image"
    t.string   "pdf"
    t.string   "mp3"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "themes", :force => true do |t|
    t.string   "image"
    t.string   "pdf"
    t.string   "name_english"
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "language_id"
    t.string   "description"
  end

  create_table "words", :force => true do |t|
    t.string   "name_english"
    t.string   "name"
    t.string   "name_image"
    t.string   "image"
    t.string   "mp3"
    t.string   "pdf"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
