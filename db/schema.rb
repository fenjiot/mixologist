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

ActiveRecord::Schema.define(version: 20141208212354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name", unique: true, using: :btree

  create_table "list_recipes", force: true do |t|
    t.integer  "list_id",    null: false
    t.integer  "recipe_id",  null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "list_recipes", ["list_id", "recipe_id"], name: "index_list_recipes_on_list_id_and_recipe_id", unique: true, using: :btree
  add_index "list_recipes", ["list_id"], name: "index_list_recipes_on_list_id", using: :btree
  add_index "list_recipes", ["recipe_id"], name: "index_list_recipes_on_recipe_id", using: :btree

  create_table "lists", force: true do |t|
    t.string   "name",       null: false
    t.integer  "serves",     null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lists", ["user_id"], name: "index_lists_on_user_id", using: :btree

  create_table "ratings", force: true do |t|
    t.integer  "rater_id",        null: false
    t.integer  "rated_recipe_id", null: false
    t.integer  "value",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "ratings", ["rated_recipe_id"], name: "index_ratings_on_rated_recipe_id", using: :btree
  add_index "ratings", ["rater_id", "rated_recipe_id"], name: "index_ratings_on_rater_id_and_rated_recipe_id", unique: true, using: :btree
  add_index "ratings", ["rater_id"], name: "index_ratings_on_rater_id", using: :btree

  create_table "recipe_ingredients", force: true do |t|
    t.integer  "recipe_id",       null: false
    t.integer  "ingredient_id",   null: false
    t.float    "quantity",        null: false
    t.string   "unit_of_measure", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "recipe_ingredients", ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id", using: :btree
  add_index "recipe_ingredients", ["recipe_id", "ingredient_id"], name: "index_recipe_ingredients_on_recipe_id_and_ingredient_id", unique: true, using: :btree
  add_index "recipe_ingredients", ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id", using: :btree

  create_table "recipes", force: true do |t|
    t.string   "name",         null: false
    t.text     "instructions", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id",      null: false
    t.integer  "serves",       null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
