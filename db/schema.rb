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

ActiveRecord::Schema.define(:version => 20110621122957) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "clues", :force => true do |t|
    t.integer  "question_id", :null => false
    t.integer  "point_cost",  :null => false
    t.string   "name",        :null => false
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clues", ["question_id"], :name => "index_clues_on_question_id"

  create_table "clues_solutions", :id => false, :force => true do |t|
    t.integer  "clue_id",     :null => false
    t.integer  "solution_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clues_solutions", ["clue_id", "solution_id"], :name => "index_clues_solutions_on_clue_id_and_solution_id", :unique => true
  add_index "clues_solutions", ["clue_id"], :name => "index_clues_solutions_on_clue_id"
  add_index "clues_solutions", ["solution_id"], :name => "index_clues_solutions_on_solution_id"

  create_table "questions", :force => true do |t|
    t.integer  "possible_points", :null => false
    t.text     "answer"
    t.string   "name",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["name"], :name => "index_questions_on_name", :unique => true

  create_table "solutions", :force => true do |t|
    t.integer  "question_id",       :null => false
    t.integer  "team_id",           :null => false
    t.string   "state",             :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "proposed_solution"
  end

  add_index "solutions", ["question_id", "team_id"], :name => "index_solutions_on_question_id_and_team_id", :unique => true
  add_index "solutions", ["question_id"], :name => "index_solutions_on_question_id"
  add_index "solutions", ["state"], :name => "index_solutions_on_state"
  add_index "solutions", ["team_id"], :name => "index_solutions_on_team_id"

  create_table "team_members_teams", :id => false, :force => true do |t|
    t.integer  "team_id",        :null => false
    t.integer  "team_member_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_members_teams", ["team_id", "team_member_id"], :name => "index_team_members_teams_on_team_id_and_team_member_id", :unique => true
  add_index "team_members_teams", ["team_id"], :name => "index_team_members_teams_on_team_id"
  add_index "team_members_teams", ["team_member_id"], :name => "index_team_members_teams_on_team_member_id"

  create_table "teams", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["name"], :name => "index_teams_on_name"

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
    t.string   "type",                   :limit => 32
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["team_id"], :name => "index_users_on_team_id"
  add_index "users", ["type"], :name => "index_users_on_type"
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
