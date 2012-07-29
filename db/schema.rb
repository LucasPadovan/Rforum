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

ActiveRecord::Schema.define(:version => 20120726023753) do

  create_table "boards", :force => true do |t|
    t.string   "title",       :limit => 50
    t.string   "categoria"
    t.string   "descripcion"
    t.integer  "padre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", :force => true do |t|
    t.string   "title",       :limit => 50
    t.integer  "board_id"
    t.integer  "user_id"
    t.text     "cuerpo"
    t.date     "fechaultcom"
    t.integer  "puntaje"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["board_id"], :name => "index_conversations_on_board_id"
  add_index "conversations", ["user_id"], :name => "index_conversations_on_user_id"

  create_table "mensajepersonals", :force => true do |t|
    t.integer  "remitente_id"
    t.integer  "destinatario_id"
    t.string   "titulo"
    t.text     "cuerpo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "estado"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "mensajepersonal_id"
    t.text     "body"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "apellido"
    t.string   "avatar"
    t.date     "fechanac"
    t.string   "firma"
    t.string   "numtel"
    t.string   "nombre"
    t.string   "pagweb"
    t.string   "pais"
    t.string   "provincia"
    t.integer  "puntuacion"
    t.string   "rango"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "notify_by_email",   :default => true
  end

  create_table "votes", :force => true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type"], :name => "index_votes_on_votable_id_and_votable_type"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
