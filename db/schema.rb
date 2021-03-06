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

ActiveRecord::Schema.define(:version => 20130319204510) do

  create_table "appr_positions", :force => true do |t|
    t.integer  "position_id"
    t.integer  "Mon"
    t.integer  "Tue"
    t.integer  "Wed"
    t.integer  "Thu"
    t.integer  "Fri"
    t.integer  "Sat"
    t.integer  "Sun"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "period_id"
  end

  create_table "avaliabilities", :force => true do |t|
    t.integer  "employee_id"
    t.string   "name"
    t.string   "description"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "ongoing"
    t.integer  "repeat"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "avaliability_items", :force => true do |t|
    t.integer  "avaliability_id"
    t.integer  "day"
    t.integer  "type_d"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "business_workdays", :force => true do |t|
    t.integer  "business_id"
    t.integer  "period_id"
    t.time     "MonStart"
    t.time     "MonEnd"
    t.time     "TueStart"
    t.time     "TueEnd"
    t.time     "WedStart"
    t.time     "WedEnd"
    t.time     "ThuStart"
    t.time     "ThuEnd"
    t.time     "FriStart"
    t.time     "FriEnd"
    t.time     "SatStart"
    t.time     "SatEnd"
    t.time     "SunStart"
    t.time     "SunEnd"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "businesses", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "work_sch_id"
    t.integer  "phone"
    t.string   "adress"
    t.integer  "subscription_id"
  end

  create_table "employee_timesheets", :force => true do |t|
    t.timestamp "punch_in",    :limit => 6
    t.timestamp "punch_out",   :limit => 6
    t.integer   "employee_id"
    t.string    "change_log"
    t.timestamp "created_at",  :limit => 6
    t.timestamp "updated_at",  :limit => 6
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.integer  "payrate"
    t.integer  "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank",            :null => false
    t.integer  "workhours"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "clocked_in"
    t.boolean  "manager"
  end

  create_table "periods", :force => true do |t|
    t.date     "p_start"
    t.date     "p_end"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "positions", :force => true do |t|
    t.string   "pos"
    t.integer  "pos_id"
    t.integer  "business_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "schedules", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "week_id"
    t.integer  "rate_this_week"
    t.integer  "total_hours"
    t.integer  "total_pay"
    t.time     "MonStart"
    t.time     "MonEnd"
    t.time     "TueStart"
    t.time     "TueEnd"
    t.time     "WedStart"
    t.time     "WedEnd"
    t.time     "ThuStart"
    t.time     "ThuEnd"
    t.time     "FriStart"
    t.time     "FriEnd"
    t.time     "SatStart"
    t.time     "SatEnd"
    t.time     "SunStart"
    t.time     "SunEnd"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "period_id"
  end

  create_table "seats", :force => true do |t|
    t.integer  "position_id"
    t.integer  "employee_id"
    t.integer  "rank"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "shifts", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_id"
  end

  create_table "timesheets", :force => true do |t|
    t.datetime "punch_in"
    t.datetime "punch_out"
    t.integer  "employee_id"
    t.string   "change_log"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weeks", :force => true do |t|
    t.integer  "business_id"
    t.date     "start_date"
    t.integer  "payroll_total"
    t.integer  "week_of_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
