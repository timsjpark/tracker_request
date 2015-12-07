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

ActiveRecord::Schema.define(version: 20151204031806) do

  create_table "branches", force: :cascade do |t|
    t.string   "branch_name"
    t.string   "latest_commit_sha"
    t.integer  "repository_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "branches", ["repository_id"], name: "index_branches_on_repository_id"

  create_table "commits", force: :cascade do |t|
    t.string   "author"
    t.string   "commit_message"
    t.integer  "branch_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "commits", ["branch_id"], name: "index_commits_on_branch_id"

  create_table "pull_request_comments", force: :cascade do |t|
    t.integer  "pr_comment_id"
    t.text     "content_text"
    t.integer  "repository_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "pull_request_comments", ["repository_id"], name: "index_pull_request_comments_on_repository_id"

  create_table "pull_requests", force: :cascade do |t|
    t.integer  "pr_id"
    t.string   "pr_state"
    t.string   "pr_base_commit"
    t.string   "pr_title"
    t.text     "pr_body"
    t.integer  "repository_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pull_requests", ["repository_id"], name: "index_pull_requests_on_repository_id"

  create_table "repositories", force: :cascade do |t|
    t.integer  "repo_id"
    t.string   "repo_name"
    t.string   "repo_full_name"
    t.integer  "number_of_forks"
    t.boolean  "forked"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "repositories", ["user_id"], name: "index_repositories_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.integer  "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "avatar_url"
    t.string   "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
