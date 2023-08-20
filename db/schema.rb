# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_20_032241) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredient_ownerships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "ingredient_id"
    t.bigint "recipe_id"
    t.decimal "user_quantity", precision: 10, scale: 2
    t.decimal "recipe_quantity", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_ingredient_ownerships_on_ingredient_id"
    t.index ["recipe_id"], name: "index_ingredient_ownerships_on_recipe_id"
    t.index ["user_id"], name: "index_ingredient_ownerships_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "measurement_unit", limit: 50, null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "description", limit: 500, null: false
    t.integer "preparation_time", null: false
    t.integer "cooking_time", null: false
    t.boolean "public", default: false, null: false
    t.string "photo", default: "defaultRecipe.jpg", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "photo", default: "defaultUser.jpg", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ingredient_ownerships", "ingredients"
  add_foreign_key "ingredient_ownerships", "recipes"
  add_foreign_key "ingredient_ownerships", "users"
  add_foreign_key "recipes", "users"
end