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

ActiveRecord::Schema.define(version: 20170318032100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "composicaos", force: :cascade do |t|
    t.float    "coeficiente"
    t.integer  "insumo_id"
    t.integer  "servico_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["insumo_id"], name: "index_composicaos_on_insumo_id", using: :btree
    t.index ["servico_id"], name: "index_composicaos_on_servico_id", using: :btree
  end

  create_table "insumos", force: :cascade do |t|
    t.string   "descricao"
    t.string   "codigo_seinfra"
    t.integer  "unidade_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "tipo",           default: 0
    t.index ["unidade_id"], name: "index_insumos_on_unidade_id", using: :btree
  end

  create_table "linhas", force: :cascade do |t|
    t.integer  "orcamento_id"
    t.integer  "servico_id"
    t.integer  "quantidade"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["orcamento_id"], name: "index_linhas_on_orcamento_id", using: :btree
    t.index ["servico_id"], name: "index_linhas_on_servico_id", using: :btree
  end

  create_table "obras", force: :cascade do |t|
    t.string   "descricao"
    t.string   "local"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orcamentos", force: :cascade do |t|
    t.integer  "obra_id"
    t.string   "nome_proprietario"
    t.string   "cpf_proprietario"
    t.float    "bdi"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.date     "data"
    t.index ["obra_id"], name: "index_orcamentos_on_obra_id", using: :btree
  end

  create_table "servicos", force: :cascade do |t|
    t.string   "item"
    t.string   "descricao"
    t.integer  "unidade_id"
    t.integer  "tipo_servico_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "codigo_seinfra"
    t.text     "especificacao"
    t.float    "vl_unidade"
    t.index ["tipo_servico_id"], name: "index_servicos_on_tipo_servico_id", using: :btree
    t.index ["unidade_id"], name: "index_servicos_on_unidade_id", using: :btree
  end

  create_table "tipo_servicos", force: :cascade do |t|
    t.integer  "father_id"
    t.string   "descricao"
    t.string   "item"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidades", force: :cascade do |t|
    t.string   "descricao"
    t.string   "sigla"
    t.integer  "qtd_dimensao"
    t.boolean  "monetaria"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_foreign_key "composicaos", "insumos"
  add_foreign_key "composicaos", "servicos"
  add_foreign_key "insumos", "unidades"
  add_foreign_key "linhas", "orcamentos"
  add_foreign_key "linhas", "servicos"
  add_foreign_key "orcamentos", "obras"
  add_foreign_key "servicos", "tipo_servicos"
  add_foreign_key "servicos", "unidades"
end
