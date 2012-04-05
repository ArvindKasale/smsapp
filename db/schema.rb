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

ActiveRecord::Schema.define(:version => 20120331121507) do

  create_table "agent_calls", :force => true do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.boolean  "attending",  :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "duration"
    t.text     "message"
  end

  create_table "categories", :force => true do |t|
    t.string   "name",        :limit => 50
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "phone_no"
    t.string   "email"
    t.text     "products"
    t.boolean  "status",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "distributors", :force => true do |t|
    t.string   "name"
    t.string   "phone_no"
    t.string   "email"
    t.text     "address"
    t.boolean  "status",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_prices", :force => true do |t|
    t.integer  "product_id"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name",        :limit => 50
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string   "first_name",     :limit => 50
    t.string   "last_name",      :limit => 50
    t.string   "address_1",      :limit => 50
    t.string   "address_2",      :limit => 50
    t.string   "landmark",       :limit => 50
    t.string   "city",           :limit => 50
    t.string   "state",          :limit => 50
    t.string   "country",        :limit => 50, :default => "India"
    t.integer  "user_id"
    t.string   "phone_number_1", :limit => 25
    t.string   "phone_number_2", :limit => 25
    t.date     "birth_date"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pincode",        :limit => 10
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"

  create_table "roles", :force => true do |t|
    t.string   "role",       :limit => 25
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sale_items", :force => true do |t|
    t.integer  "user_id"
    t.date     "sale_date"
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "total_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shop_keepers", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.text     "products"
    t.boolean  "status",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id",                               :default => 3
    t.string   "name",                   :limit => 50
    t.text     "address",                :limit => 50
    t.text     "phone_no",               :limit => 10
    t.date     "birth_date"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
