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

ActiveRecord::Schema.define(version: 20161125044422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "band_id"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree
  end

  create_table "album", force: :cascade do |t|
    t.string   "name"
    t.string   "album_type"
    t.string   "released"
    t.string   "description"
    t.integer  "band_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["band_id"], name: "index_album_on_band_id", using: :btree
  end

  create_table "album_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "album_id"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_comments_on_album_id", using: :btree
    t.index ["user_id"], name: "index_album_comments_on_user_id", using: :btree
  end

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.string   "album_type"
    t.string   "released"
    t.string   "description"
    t.integer  "band_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "album_art_file_name"
    t.string   "album_art_content_type"
    t.integer  "album_art_file_size"
    t.datetime "album_art_updated_at"
    t.index ["band_id"], name: "index_albums_on_band_id", using: :btree
  end

  create_table "article_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_comments_on_article_id", using: :btree
    t.index ["user_id"], name: "index_article_comments_on_user_id", using: :btree
  end

  create_table "article_photos", force: :cascade do |t|
    t.integer  "article_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["article_id"], name: "index_article_photos_on_article_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "band_id"
    t.boolean  "public"
    t.boolean  "flag"
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
  end

  create_table "badges_sashes", force: :cascade do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
    t.index ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id", using: :btree
    t.index ["badge_id"], name: "index_badges_sashes_on_badge_id", using: :btree
    t.index ["sash_id"], name: "index_badges_sashes_on_sash_id", using: :btree
  end

  create_table "bands", force: :cascade do |t|
    t.string   "group_name"
    t.string   "genre"
    t.string   "city"
    t.string   "state"
    t.integer  "user_id"
    t.string   "description"
    t.string   "website"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "band_avatar_file_name"
    t.string   "band_avatar_content_type"
    t.integer  "band_avatar_file_size"
    t.datetime "band_avatar_updated_at"
    t.integer  "sash_id"
    t.integer  "level",                    default: 0
    t.index ["user_id"], name: "index_bands_on_user_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "band_id"
    t.string   "title"
    t.string   "date"
    t.string   "time"
    t.string   "description"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "ticket_link"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "flyer_file_name"
    t.string   "flyer_content_type"
    t.integer  "flyer_file_size"
    t.datetime "flyer_updated_at"
  end

  create_table "follows", force: :cascade do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables", using: :btree
    t.index ["follower_id", "follower_type"], name: "fk_follows", using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
    t.index ["likeable_id", "likeable_type"], name: "fk_likeables", using: :btree
    t.index ["liker_id", "liker_type"], name: "fk_likes", using: :btree
  end

  create_table "members", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "band_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_members_on_band_id", using: :btree
  end

  create_table "mentions", force: :cascade do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
    t.index ["mentionable_id", "mentionable_type"], name: "fk_mentionables", using: :btree
    t.index ["mentioner_id", "mentioner_type"], name: "fk_mentions", using: :btree
  end

  create_table "merit_actions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action_method"
    t.integer  "action_value"
    t.boolean  "had_errors",    default: false
    t.string   "target_model"
    t.integer  "target_id"
    t.text     "target_data"
    t.boolean  "processed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_activity_logs", force: :cascade do |t|
    t.integer  "action_id"
    t.string   "related_change_type"
    t.integer  "related_change_id"
    t.string   "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: :cascade do |t|
    t.integer  "score_id"
    t.integer  "num_points", default: 0
    t.string   "log"
    t.datetime "created_at"
  end

  create_table "merit_scores", force: :cascade do |t|
    t.integer "sash_id"
    t.string  "category", default: "default"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "rs_evaluations", force: :cascade do |t|
    t.string   "reputation_name"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "target_id"
    t.string   "target_type"
    t.float    "value",           default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["reputation_name", "source_id", "source_type", "target_id", "target_type"], name: "index_rs_evaluations_on_reputation_name_and_source_and_target", unique: true, using: :btree
    t.index ["reputation_name"], name: "index_rs_evaluations_on_reputation_name", using: :btree
    t.index ["source_id", "source_type"], name: "index_rs_evaluations_on_source_id_and_source_type", using: :btree
    t.index ["target_id", "target_type"], name: "index_rs_evaluations_on_target_id_and_target_type", using: :btree
  end

  create_table "rs_reputation_messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "receiver_id"
    t.float    "weight",      default: 1.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["receiver_id", "sender_id", "sender_type"], name: "index_rs_reputation_messages_on_receiver_id_and_sender", unique: true, using: :btree
    t.index ["receiver_id"], name: "index_rs_reputation_messages_on_receiver_id", using: :btree
    t.index ["sender_id", "sender_type"], name: "index_rs_reputation_messages_on_sender_id_and_sender_type", using: :btree
  end

  create_table "rs_reputations", force: :cascade do |t|
    t.string   "reputation_name"
    t.float    "value",           default: 0.0
    t.string   "aggregated_by"
    t.integer  "target_id"
    t.string   "target_type"
    t.boolean  "active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
    t.index ["reputation_name", "target_id", "target_type"], name: "index_rs_reputations_on_reputation_name_and_target", unique: true, using: :btree
    t.index ["reputation_name"], name: "index_rs_reputations_on_reputation_name", using: :btree
    t.index ["target_id", "target_type"], name: "index_rs_reputations_on_target_id_and_target_type", using: :btree
  end

  create_table "sashes", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.integer  "track_number"
    t.string   "description"
    t.integer  "album_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "audio_file_file_name"
    t.string   "audio_file_content_type"
    t.integer  "audio_file_file_size"
    t.datetime "audio_file_updated_at"
    t.integer  "band_id"
    t.index ["album_id"], name: "index_songs_on_album_id", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "zipcode"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "admin"
    t.boolean  "editor"
    t.string   "state"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "album_comments", "albums"
  add_foreign_key "album_comments", "users"
  add_foreign_key "albums", "bands"
  add_foreign_key "article_comments", "articles"
  add_foreign_key "article_comments", "users"
  add_foreign_key "article_photos", "articles"
  add_foreign_key "articles", "users"
  add_foreign_key "bands", "users"
  add_foreign_key "members", "bands"
  add_foreign_key "songs", "albums"
end
