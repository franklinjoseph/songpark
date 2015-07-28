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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150610125515) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "article_tags", force: :cascade do |t|
    t.integer  "tag_id",     limit: 4
    t.integer  "article_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author",      limit: 255
    t.string   "video_url",   limit: 255
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "attachment_type",   limit: 255
    t.integer  "attachment_id",     limit: 4
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audit_logs", force: :cascade do |t|
    t.string   "event",        limit: 255
    t.string   "message",      limit: 255
    t.integer  "auditor_id",   limit: 4
    t.string   "auditor_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "audit_logs", ["auditor_id", "auditor_type"], name: "index_audit_logs_on_auditor_id_and_auditor_type", using: :btree

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "name",             limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
    t.integer  "user_id",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id", using: :btree

  create_table "comfy_cms_blocks", force: :cascade do |t|
    t.string   "identifier",     limit: 255,      null: false
    t.text     "content",        limit: 16777215
    t.integer  "blockable_id",   limit: 4
    t.string   "blockable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_blocks", ["blockable_id", "blockable_type"], name: "index_comfy_cms_blocks_on_blockable_id_and_blockable_type", using: :btree
  add_index "comfy_cms_blocks", ["identifier"], name: "index_comfy_cms_blocks_on_identifier", using: :btree

  create_table "comfy_cms_categories", force: :cascade do |t|
    t.integer "site_id",          limit: 4,   null: false
    t.string  "label",            limit: 255, null: false
    t.string  "categorized_type", limit: 255, null: false
  end

  add_index "comfy_cms_categories", ["site_id", "categorized_type", "label"], name: "index_cms_categories_on_site_id_and_cat_type_and_label", unique: true, using: :btree

  create_table "comfy_cms_categorizations", force: :cascade do |t|
    t.integer "category_id",      limit: 4,   null: false
    t.string  "categorized_type", limit: 255, null: false
    t.integer "categorized_id",   limit: 4,   null: false
  end

  add_index "comfy_cms_categorizations", ["category_id", "categorized_type", "categorized_id"], name: "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", unique: true, using: :btree

  create_table "comfy_cms_files", force: :cascade do |t|
    t.integer  "site_id",           limit: 4,                null: false
    t.integer  "block_id",          limit: 4
    t.string   "label",             limit: 255,              null: false
    t.string   "file_file_name",    limit: 255,              null: false
    t.string   "file_content_type", limit: 255,              null: false
    t.integer  "file_file_size",    limit: 4,                null: false
    t.string   "description",       limit: 2048
    t.integer  "position",          limit: 4,    default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_files", ["site_id", "block_id"], name: "index_comfy_cms_files_on_site_id_and_block_id", using: :btree
  add_index "comfy_cms_files", ["site_id", "file_file_name"], name: "index_comfy_cms_files_on_site_id_and_file_file_name", using: :btree
  add_index "comfy_cms_files", ["site_id", "label"], name: "index_comfy_cms_files_on_site_id_and_label", using: :btree
  add_index "comfy_cms_files", ["site_id", "position"], name: "index_comfy_cms_files_on_site_id_and_position", using: :btree

  create_table "comfy_cms_layouts", force: :cascade do |t|
    t.integer  "site_id",    limit: 4,                        null: false
    t.integer  "parent_id",  limit: 4
    t.string   "app_layout", limit: 255
    t.string   "label",      limit: 255,                      null: false
    t.string   "identifier", limit: 255,                      null: false
    t.text     "content",    limit: 16777215
    t.text     "css",        limit: 16777215
    t.text     "js",         limit: 16777215
    t.integer  "position",   limit: 4,        default: 0,     null: false
    t.boolean  "is_shared",  limit: 1,        default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_layouts", ["parent_id", "position"], name: "index_comfy_cms_layouts_on_parent_id_and_position", using: :btree
  add_index "comfy_cms_layouts", ["site_id", "identifier"], name: "index_comfy_cms_layouts_on_site_id_and_identifier", unique: true, using: :btree

  create_table "comfy_cms_pages", force: :cascade do |t|
    t.integer  "site_id",        limit: 4,                        null: false
    t.integer  "layout_id",      limit: 4
    t.integer  "parent_id",      limit: 4
    t.integer  "target_page_id", limit: 4
    t.string   "label",          limit: 255,                      null: false
    t.string   "slug",           limit: 255
    t.string   "full_path",      limit: 255,                      null: false
    t.text     "content_cache",  limit: 16777215
    t.integer  "position",       limit: 4,        default: 0,     null: false
    t.integer  "children_count", limit: 4,        default: 0,     null: false
    t.boolean  "is_published",   limit: 1,        default: true,  null: false
    t.boolean  "is_shared",      limit: 1,        default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_pages", ["parent_id", "position"], name: "index_comfy_cms_pages_on_parent_id_and_position", using: :btree
  add_index "comfy_cms_pages", ["site_id", "full_path"], name: "index_comfy_cms_pages_on_site_id_and_full_path", using: :btree

  create_table "comfy_cms_revisions", force: :cascade do |t|
    t.string   "record_type", limit: 255,      null: false
    t.integer  "record_id",   limit: 4,        null: false
    t.text     "data",        limit: 16777215
    t.datetime "created_at"
  end

  add_index "comfy_cms_revisions", ["record_type", "record_id", "created_at"], name: "index_cms_revisions_on_rtype_and_rid_and_created_at", using: :btree

  create_table "comfy_cms_sites", force: :cascade do |t|
    t.string  "label",       limit: 255,                 null: false
    t.string  "identifier",  limit: 255,                 null: false
    t.string  "hostname",    limit: 255,                 null: false
    t.string  "path",        limit: 255
    t.string  "locale",      limit: 255, default: "en",  null: false
    t.boolean "is_mirrored", limit: 1,   default: false, null: false
  end

  add_index "comfy_cms_sites", ["hostname"], name: "index_comfy_cms_sites_on_hostname", using: :btree
  add_index "comfy_cms_sites", ["is_mirrored"], name: "index_comfy_cms_sites_on_is_mirrored", using: :btree

  create_table "comfy_cms_snippets", force: :cascade do |t|
    t.integer  "site_id",    limit: 4,                        null: false
    t.string   "label",      limit: 255,                      null: false
    t.string   "identifier", limit: 255,                      null: false
    t.text     "content",    limit: 16777215
    t.integer  "position",   limit: 4,        default: 0,     null: false
    t.boolean  "is_shared",  limit: 1,        default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_snippets", ["site_id", "identifier"], name: "index_comfy_cms_snippets_on_site_id_and_identifier", unique: true, using: :btree
  add_index "comfy_cms_snippets", ["site_id", "position"], name: "index_comfy_cms_snippets_on_site_id_and_position", using: :btree

  create_table "contact_numbers", force: :cascade do |t|
    t.string   "number",               limit: 255
    t.string   "department",           limit: 255
    t.integer  "insurance_company_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "telephone",  limit: 255
    t.text     "message",    limit: 65535
    t.string   "token",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "country_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drivers", force: :cascade do |t|
    t.integer  "user_motor_id",    limit: 4
    t.string   "name",             limit: 255
    t.string   "nric",             limit: 255
    t.date     "dob"
    t.string   "gender",           limit: 255
    t.string   "marital_status",   limit: 255
    t.string   "nationality",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "relation",         limit: 255
    t.string   "occupation",       limit: 255
    t.string   "person_type",      limit: 255
    t.integer  "person_id",        limit: 4
    t.string   "email",            limit: 255
    t.string   "telephone_home",   limit: 255
    t.string   "telephone_mobile", limit: 255
    t.text     "address",          limit: 65535
  end

  create_table "exclusion_sections", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "insurance_id", limit: 4
  end

  create_table "images", force: :cascade do |t|
    t.integer  "article_id",           limit: 4
    t.string   "picture_file_name",    limit: 255
    t.string   "picture_content_type", limit: 255
    t.integer  "picture_file_size",    limit: 4
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "news_admin_id",        limit: 4
  end

  create_table "insurance_companies", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.text     "description",           limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "credit_rating",         limit: 255
    t.string   "address",               limit: 255
    t.string   "email",                 limit: 255
    t.boolean  "com_eligibility",       limit: 1
    t.text     "factor_1",              limit: 65535
    t.integer  "score_1",               limit: 4
    t.text     "factor_2",              limit: 65535
    t.integer  "score_2",               limit: 4
    t.boolean  "status",                limit: 1
    t.integer  "company_logo_id",       limit: 4
    t.text     "operating_hours",       limit: 65535
    t.string   "source_of_information", limit: 255
  end

  create_table "insurance_company_controls", force: :cascade do |t|
    t.integer  "motor_insurance_control_id", limit: 4
    t.integer  "insurance_company_id",       limit: 4
    t.string   "control_action",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurance_conditions", force: :cascade do |t|
    t.string   "condition_type",     limit: 255
    t.integer  "condition_id",       limit: 4
    t.integer  "motor_condition_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurance_exclusions", force: :cascade do |t|
    t.string   "exclusion_type",     limit: 255
    t.integer  "exclusion_id",       limit: 4
    t.integer  "motor_exclusion_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurance_make_restrictions", force: :cascade do |t|
    t.integer  "motor_insurance_id", limit: 4
    t.integer  "make_id",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurance_non_age_restrictions", force: :cascade do |t|
    t.integer  "motor_restriction_id",  limit: 4
    t.integer  "sub_category_id",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "policy_restriction_id", limit: 4
  end

  create_table "insurances", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "insurance_type", limit: 255
    t.integer  "version_number", limit: 4
    t.integer  "admin_user_id",  limit: 4
    t.string   "status",         limit: 255
  end

  create_table "makes", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "manufacturer_id", limit: 255
  end

  create_table "motor_condition_sections", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "insurance_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motor_conditions", force: :cascade do |t|
    t.string   "keyword",                    limit: 255
    t.text     "explanation",                limit: 65535
    t.integer  "motor_condition_section_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "counter",                    limit: 4,     default: 0
  end

  create_table "motor_declarations", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motor_exclusions", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "keyword",              limit: 255
    t.text     "explanation",          limit: 65535
    t.integer  "exclusion_section_id", limit: 4
    t.integer  "counter",              limit: 4,     default: 0
  end

  create_table "motor_insurance_anomalies", force: :cascade do |t|
    t.integer  "motor_insurance_id",    limit: 4
    t.string   "anomaly_type",          limit: 255
    t.string   "explanation",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority",              limit: 4,     default: 0
    t.string   "score_comments",        limit: 255
    t.text     "policy_wording",        limit: 65535
    t.string   "keyword",               limit: 255
    t.integer  "anomaly_id",            limit: 4
    t.text     "top_three_explanation", limit: 65535
    t.float    "score",                 limit: 24
  end

  create_table "motor_insurance_conditions", force: :cascade do |t|
    t.integer  "motor_insurance_id", limit: 4
    t.integer  "motor_condition_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motor_insurance_configs", force: :cascade do |t|
    t.integer  "lower_limit",                     limit: 4
    t.integer  "upper_limit",                     limit: 4
    t.integer  "mean",                            limit: 4
    t.float    "deviation",                       limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "basic_coverage_fire_price",       limit: 4
    t.integer  "extra_coverage_fire_price",       limit: 4
    t.integer  "max_score_benchmark_calibration", limit: 4
    t.integer  "min_score_benchmark_calibration", limit: 4
    t.float    "basic_coverage_tp_factor",        limit: 24
    t.float    "basic_coverage_tpft_factor",      limit: 24
    t.float    "extra_coverage_tp_factor",        limit: 24
    t.float    "extra_coverage_tpft_factor",      limit: 24
    t.integer  "insurance_id",                    limit: 4
  end

  create_table "motor_insurance_controls", force: :cascade do |t|
    t.string   "control_type",   limit: 255
    t.integer  "control_action", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motor_insurance_declarations", force: :cascade do |t|
    t.integer  "motor_insurance_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "restricted",         limit: 1
    t.text     "description",        limit: 65535
    t.string   "declaration_type",   limit: 255
    t.integer  "declaration_id",     limit: 4
    t.string   "selection",          limit: 255
  end

  create_table "motor_insurance_exclusions", force: :cascade do |t|
    t.integer  "motor_insurance_id", limit: 4
    t.integer  "motor_exclusion_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motor_insurance_ratings", force: :cascade do |t|
    t.integer  "motor_insurance_id", limit: 4
    t.integer  "motor_rating_id",    limit: 4
    t.float    "score",              limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_input",         limit: 4
    t.text     "policy_wording",     limit: 65535
    t.boolean  "symbol",             limit: 1
    t.string   "comments",           limit: 255
    t.integer  "priority",           limit: 4,     default: 0
    t.integer  "coverage",           limit: 4
    t.text     "explanation",        limit: 65535
    t.string   "rating_type",        limit: 255
    t.integer  "rating_id",          limit: 4
  end

  create_table "motor_insurances", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.string   "insurance_type",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "base_price",           limit: 4
    t.integer  "excess",               limit: 4
    t.integer  "insurance_company_id", limit: 4
    t.text     "rating_summary",       limit: 65535
    t.string   "make_model_criteria",  limit: 255
  end

  create_table "motor_model_restrictions", force: :cascade do |t|
    t.integer  "motor_insurance_id", limit: 4
    t.integer  "motor_id",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motor_rating_ranges", force: :cascade do |t|
    t.integer  "upper_limit",     limit: 4
    t.integer  "lower_limit",     limit: 4
    t.integer  "range_score",     limit: 4
    t.integer  "motor_rating_id", limit: 4
    t.text     "range_comment",   limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motor_ratings", force: :cascade do |t|
    t.string   "tp",                    limit: 255
    t.string   "tpft",                  limit: 255
    t.string   "keyword",               limit: 255
    t.text     "explanation",           limit: 65535
    t.integer  "lower_limit",           limit: 4
    t.integer  "upper_limit",           limit: 4
    t.string   "rating_type",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_step",            limit: 4
    t.integer  "interval",              limit: 4
    t.integer  "rating_sub_section_id", limit: 4
    t.boolean  "basic_coverage",        limit: 1
    t.text     "score_comment",         limit: 65535
    t.text     "limit_comment",         limit: 65535
    t.text     "range_comment",         limit: 65535
    t.integer  "counter",               limit: 4,     default: 0
    t.float    "max_score",             limit: 24,    default: 0.0
  end

  create_table "motor_restrictions", force: :cascade do |t|
    t.integer  "motor_insurance_id",         limit: 4
    t.string   "restriction_type",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "criteria",                   limit: 255
    t.integer  "sub_category_id",            limit: 4
    t.string   "insurance_restriction_type", limit: 255
    t.integer  "insurance_restriction_id",   limit: 4
  end

  create_table "motor_searches", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year",              limit: 4
    t.string   "license",           limit: 255
    t.string   "driver_age",        limit: 255
    t.integer  "number_of_drivers", limit: 4
    t.integer  "make_id",           limit: 4
    t.integer  "motor_id",          limit: 4
    t.integer  "ncd",               limit: 4
  end

  create_table "motors", force: :cascade do |t|
    t.string   "modal",            limit: 255
    t.string   "body_type",        limit: 255
    t.string   "engin_capacity",   limit: 255
    t.date     "year_make"
    t.integer  "seating_capacity", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "make_id",          limit: 4
    t.string   "model_id",         limit: 255
  end

  create_table "news_admins", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "snippet",    limit: 65535
    t.string   "url",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video_url",  limit: 255
    t.string   "author",     limit: 255
  end

  create_table "news_tags", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "news_admin_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mid",                     limit: 255
    t.string   "merchant_txn_ref",        limit: 255
    t.string   "nets_txn_ref",            limit: 255
    t.string   "nets_txn_dtm",            limit: 255
    t.string   "nets_txn_status",         limit: 255
    t.string   "nets_txn_resp_code",      limit: 255
    t.string   "nets_txn_msg",            limit: 255
    t.integer  "nets_amt_cents_deducted", limit: 4
    t.string   "bank_auth_id",            limit: 255
    t.string   "payment_mode",            limit: 255
    t.string   "bank_id",                 limit: 255
    t.string   "tid",                     limit: 255
    t.string   "merchant_cert_id",        limit: 255
    t.string   "bank_remarks",            limit: 255
    t.datetime "bank_txn_date_time"
    t.string   "bank_time_zone",          limit: 255
    t.string   "txn_fun_currency_code",   limit: 255
    t.string   "txn_func_amt",            limit: 255
    t.string   "txn_dest_currency_code",  limit: 255
    t.string   "txn_dest_amt",            limit: 255
    t.string   "txn_src_currency_code",   limit: 255
    t.string   "txn_src_amt",             limit: 255
    t.string   "src_func_exchange_rate",  limit: 255
    t.string   "func_dest_exchange_rate", limit: 255
    t.datetime "gw_txn_date_time"
    t.string   "gw_value_date",           limit: 255
    t.string   "gw_time_zone",            limit: 255
    t.string   "bank_status",             limit: 255
    t.integer  "retry",                   limit: 4
    t.string   "version",                 limit: 255
    t.string   "params1",                 limit: 255
    t.string   "params2",                 limit: 255
    t.string   "params3",                 limit: 255
    t.string   "params4",                 limit: 255
    t.string   "params5",                 limit: 255
    t.string   "params11",                limit: 255
    t.string   "params12",                limit: 255
    t.string   "params13",                limit: 255
    t.string   "params14",                limit: 255
    t.string   "params15",                limit: 255
    t.integer  "user_id",                 limit: 4
  end

  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "policy_age_restrictions", force: :cascade do |t|
    t.integer  "policy_restriction_id", limit: 4
    t.integer  "lower_limit",           limit: 4
    t.integer  "upper_limit",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "policy_restrictions", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "criteria",         limit: 255
    t.integer  "restriction_id",   limit: 4
    t.string   "restriction_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name",           limit: 255, default: ""
    t.string   "last_name",            limit: 255, default: ""
    t.date     "dob"
    t.integer  "image_id",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nirc",                 limit: 255
    t.string   "marital_status",       limit: 255
    t.integer  "age",                  limit: 4
    t.string   "nationality",          limit: 255
    t.string   "gender",               limit: 255
    t.string   "telephone_home",       limit: 255
    t.string   "telephone_mobile",     limit: 255
    t.string   "race",                 limit: 255
    t.string   "occupation",           limit: 255
    t.string   "address",              limit: 255
    t.string   "facebook_image_url",   limit: 255
    t.string   "driving_experience",   limit: 255
    t.string   "certificate_of_merit", limit: 255
    t.string   "postal_code",          limit: 255
  end

  create_table "property_insurances", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.integer  "base_price",           limit: 4
    t.integer  "excess",               limit: 4
    t.integer  "insurance_company_id", limit: 4
    t.text     "rating_summary",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_search_insurance_declarations", force: :cascade do |t|
    t.integer  "motor_insurance_declaration_id", limit: 4
    t.text     "explanation",                    limit: 65535
    t.boolean  "require",                        limit: 1
    t.integer  "property_search_id",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_searches", force: :cascade do |t|
    t.string   "property_type",         limit: 255
    t.string   "ownership_type",        limit: 255
    t.date     "start_date"
    t.integer  "coverage_amount",       limit: 4
    t.integer  "user_id",               limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_insurance_id", limit: 4
  end

  create_table "rating_sections", force: :cascade do |t|
    t.string   "section_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "insurance_id", limit: 4
  end

  create_table "rating_sub_sections", force: :cascade do |t|
    t.string   "sub_section_name",  limit: 255
    t.integer  "rating_section_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restriction_sub_categories", force: :cascade do |t|
    t.integer  "sub_category_id",      limit: 4
    t.integer  "motor_restriction_id", limit: 4
    t.integer  "upper_limit",          limit: 4
    t.integer  "lower_limit",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "category",   limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travel_insurances", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.integer  "base_price",           limit: 4
    t.integer  "excess",               limit: 4
    t.integer  "insurance_company_id", limit: 4
    t.text     "rating_summary",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travel_search_countries", force: :cascade do |t|
    t.integer  "country_id",       limit: 4
    t.integer  "travel_search_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travel_search_insurance_declarations", force: :cascade do |t|
    t.integer  "motor_insurance_declaration_id", limit: 4
    t.text     "explanation",                    limit: 65535
    t.boolean  "require",                        limit: 1
    t.integer  "travel_search_id",               limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travel_searches", force: :cascade do |t|
    t.string   "coverage_type",       limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "no_of_travellers",    limit: 4
    t.integer  "age",                 limit: 4
    t.string   "coverage_plan",       limit: 255
    t.string   "coverage_people",     limit: 255
    t.integer  "user_id",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "travel_insurance_id", limit: 4
  end

  create_table "user_motor_insurance_declarations", force: :cascade do |t|
    t.integer  "user_motor_id",                  limit: 4
    t.integer  "motor_insurance_declaration_id", limit: 4
    t.text     "explanation",                    limit: 65535
    t.boolean  "require",                        limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_motors", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.integer  "motor_id",            limit: 4
    t.string   "registration_number", limit: 255
    t.string   "engin_number",        limit: 255
    t.string   "chasis_number",       limit: 255
    t.string   "bank",                limit: 255
    t.string   "modifications",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "distance",            limit: 255
    t.string   "purpose",             limit: 255
    t.boolean  "off_peak_car",        limit: 1
    t.boolean  "accident_claim",      limit: 1
    t.integer  "motor_insurance_id",  limit: 4
    t.date     "start_date"
    t.string   "body_type",           limit: 255
    t.string   "engine_capacity",     limit: 255
    t.string   "seating_capacity",    limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.integer  "profile_id",             limit: 4
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token",   limit: 255
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string   "plate_number",      limit: 255
    t.integer  "registration_year", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "motor_id",          limit: 4
  end

end
