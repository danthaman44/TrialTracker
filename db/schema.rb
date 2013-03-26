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

ActiveRecord::Schema.define(:version => 20130326214305) do

  create_table "connections", :force => true do |t|
    t.string   "acceptinguser"
    t.string   "invitinguser"
    t.string   "status"
    t.integer  "trialID"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "entries", :force => true do |t|
    t.integer  "enrolled"
    t.integer  "active"
    t.integer  "completed"
    t.integer  "withdrawn"
    t.integer  "refused"
    t.integer  "lost"
    t.integer  "trial_id"
    t.date     "input_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "splashes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trials", :force => true do |t|
    t.integer  "trialID"
    t.string   "trialName"
    t.date     "startDate"
    t.date     "endDate"
    t.integer  "enrolledGoal"
    t.integer  "completedGoal"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "userowner"
  end

  create_table "trials_users", :id => false, :force => true do |t|
    t.integer "trial_id"
    t.integer "user_id"
  end

  add_index "trials_users", ["trial_id", "user_id"], :name => "index_trials_users_on_trial_id_and_user_id"
  add_index "trials_users", ["user_id", "trial_id"], :name => "index_trials_users_on_user_id_and_trial_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.integer  "trial_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
