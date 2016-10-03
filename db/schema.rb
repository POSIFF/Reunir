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

ActiveRecord::Schema.define(version: 20160929222706) do

  create_table "atas", force: :cascade do |t|
    t.string   "codigo"
    t.string   "descricao"
    t.string   "autor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "reuniao_id"
    t.index ["reuniao_id"], name: "index_atas_on_reuniao_id"
  end

  create_table "coordreunioes", force: :cascade do |t|
    t.integer  "matricula"
    t.string   "nome"
    t.string   "funcao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "foto"
  end

  create_table "gerencias", force: :cascade do |t|
    t.string   "sigla"
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pautas", force: :cascade do |t|
    t.string   "codigo"
    t.string   "descricao"
    t.string   "autor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "reuniao_id"
    t.index ["reuniao_id"], name: "index_pautas_on_pauta_id"
  end

  create_table "reunioes", force: :cascade do |t|
    t.string   "codigo"
    t.string   "descricao"
    t.date     "data"
    t.string   "hora"
    t.string   "local"
    t.string   "convidados"
    t.string   "observacoes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "gerencia_id"
    t.integer  "coordreuniao_id"
    t.integer  "usuario_id"
    t.index ["coordreuniao_id"], name: "index_reunioes_on_coordreuniao_id"
    t.index ["gerencia_id"], name: "index_reunioes_on_gerencia_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

end
