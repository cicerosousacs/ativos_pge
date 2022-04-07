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

ActiveRecord::Schema.define(version: 2022_04_07_012418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addativos", force: :cascade do |t|
    t.bigint "vinculo_id"
    t.bigint "ativo_id"
    t.bigint "condicao_id"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ativo_id"], name: "index_addativos_on_ativo_id"
    t.index ["condicao_id"], name: "index_addativos_on_condicao_id"
    t.index ["vinculo_id"], name: "index_addativos_on_vinculo_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.boolean "status"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "aquisicao_modalidades", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aquisicao_origems", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aquisicaos", force: :cascade do |t|
    t.string "item"
    t.string "quantidade"
    t.string "gestor"
    t.date "data_aquisicao"
    t.bigint "aquisicao_modalidade_id"
    t.string "numero_contrato"
    t.bigint "aquisicao_origem_id"
    t.string "empresa_contratada"
    t.string "parte_interressada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "valor"
    t.index ["aquisicao_modalidade_id"], name: "index_aquisicaos_on_aquisicao_modalidade_id"
    t.index ["aquisicao_origem_id"], name: "index_aquisicaos_on_aquisicao_origem_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ativos", force: :cascade do |t|
    t.bigint "tipo_id"
    t.bigint "marca_id"
    t.string "modelo"
    t.string "serial"
    t.string "tombo"
    t.text "especificacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "aquisicao_id"
    t.index ["aquisicao_id"], name: "index_ativos_on_aquisicao_id"
    t.index ["marca_id"], name: "index_ativos_on_marca_id"
    t.index ["tipo_id"], name: "index_ativos_on_tipo_id"
  end

  create_table "condicaos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marcas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subareas", force: :cascade do |t|
    t.bigint "area_id"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_subareas_on_area_id"
  end

  create_table "tipos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ativos_count"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "suporte"
  end

  create_table "vinculos", force: :cascade do |t|
    t.bigint "usuario_id"
    t.bigint "area_id"
    t.bigint "subarea_id"
    t.string "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_vinculos_on_area_id"
    t.index ["subarea_id"], name: "index_vinculos_on_subarea_id"
    t.index ["usuario_id"], name: "index_vinculos_on_usuario_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addativos", "ativos"
  add_foreign_key "addativos", "condicaos"
  add_foreign_key "addativos", "vinculos"
  add_foreign_key "aquisicaos", "aquisicao_modalidades"
  add_foreign_key "aquisicaos", "aquisicao_origems"
  add_foreign_key "ativos", "aquisicaos"
  add_foreign_key "ativos", "marcas"
  add_foreign_key "ativos", "tipos"
  add_foreign_key "subareas", "areas"
  add_foreign_key "vinculos", "areas"
  add_foreign_key "vinculos", "subareas"
  add_foreign_key "vinculos", "usuarios"
end
