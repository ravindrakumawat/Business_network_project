# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100429060126) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "shared",      :default => 1
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["user_id"], :name => "index_albums_on_user_id"

  create_table "blogs", :force => true do |t|
    t.integer "user_id"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "body"
    t.datetime "created_at"
  end

  create_table "companies", :force => true do |t|
    t.integer  "user_id",                      :null => false
    t.string   "company_name", :default => ""
    t.string   "title",        :default => ""
    t.date     "time_from"
    t.date     "time_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string "name"
  end

  create_table "currencies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", :force => true do |t|
    t.integer  "user_id",                :null => false
    t.text     "interest"
    t.text     "address"
    t.text     "groups_and_association"
    t.text     "skillz"
    t.text     "schools"
    t.text     "honors_and_awards"
    t.text     "activities"
    t.text     "additional_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", :force => true do |t|
    t.string   "event_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "from_datentime"
    t.datetime "to_datentime"
    t.boolean  "virtual"
    t.string   "venue"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "postalcode"
    t.string   "website"
    t.text     "description"
    t.integer  "eventtype_id"
    t.integer  "industry_id"
    t.text     "keywords"
    t.text     "attender"
    t.string   "organization"
    t.string   "attending"
    t.boolean  "organizing"
    t.boolean  "free"
    t.integer  "price"
    t.string   "repeat"
    t.string   "edit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "accepted_at"
  end

  create_table "functions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_chats", :force => true do |t|
    t.text     "chat_field"
    t.string   "user_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_joins", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_types", :force => true do |t|
    t.string   "group_type_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "group_name"
    t.integer  "group_type_id"
    t.text     "summery"
    t.text     "description"
    t.string   "website"
    t.integer  "user_id"
    t.string   "access"
    t.integer  "language_id"
    t.boolean  "location"
    t.boolean  "agreement"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "industries", :force => true do |t|
    t.string   "industry_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.string   "title"
    t.string   "company_name"
    t.integer  "location_id"
    t.integer  "country_id"
    t.string   "pincode"
    t.string   "company_url"
    t.integer  "job_type"
    t.integer  "experience"
    t.string   "industry_ids"
    t.string   "function_ids"
    t.integer  "user_id"
    t.integer  "currency_id"
    t.float    "compensation"
    t.integer  "schema"
    t.string   "add_information"
    t.float    "bonus"
    t.string   "bonus_description"
    t.text     "job_description"
    t.text     "skills"
    t.text     "company_description"
    t.boolean  "local_candidate_only"
    t.boolean  "third_party_not_accepted"
    t.string   "email"
    t.string   "website"
    t.integer  "language_id"
    t.integer  "employer_job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.string   "subject"
    t.string   "message"
    t.string   "receiver"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "onlines", :force => true do |t|
    t.integer  "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "user_id",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "pictures", ["album_id"], :name => "index_pictures_on_album_id"

  create_table "posts", :force => true do |t|
    t.integer  "blog_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "maidenname"
    t.string   "headline"
    t.integer  "country"
    t.integer  "state"
    t.integer  "city"
    t.integer  "zipcode"
    t.integer  "industry"
    t.string   "companyname"
    t.string   "title"
    t.date     "timefrom"
    t.date     "timeto"
    t.text     "description"
    t.string   "schoolname"
    t.string   "degree"
    t.string   "fields"
    t.date     "dateattend"
    t.text     "activities"
    t.text     "addnote"
    t.integer  "websitetitle"
    t.string   "website"
    t.text     "interest"
    t.text     "awards"
    t.integer  "phonetype"
    t.string   "phone"
    t.integer  "imtype"
    t.string   "im"
    t.text     "address"
    t.date     "birthday"
    t.integer  "maritalstatus"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :default => "", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "share_videos", :force => true do |t|
    t.string   "title"
    t.string   "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sounds", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specs", :force => true do |t|
    t.integer  "user_id",                    :null => false
    t.string   "first_name", :default => ""
    t.string   "last_name",  :default => ""
    t.string   "gender"
    t.date     "birthdate"
    t.string   "occupation", :default => ""
    t.string   "city",       :default => ""
    t.string   "state",      :default => ""
    t.string   "zip_code",   :default => ""
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "headline"
    t.integer  "industry"
  end

  create_table "topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "reset_code"
    t.datetime "reset_code_until"
    t.integer  "friends_count",                           :default => 0, :null => false
  end

  create_table "video_replies", :force => true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.integer  "parent_id"
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.string   "state"
    t.integer  "user_id"
    t.integer  "thumbnail_id"
  end

end
