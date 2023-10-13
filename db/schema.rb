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

ActiveRecord::Schema[7.0].define(version: 2023_10_13_061049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "municipalities", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "municipality_areas", force: :cascade do |t|
    t.bigint "municipality_id", null: false
    t.geometry "area", limit: {:srid=>3857, :type=>"st_polygon"}, null: false
    t.index ["area"], name: "index_municipality_areas_on_area", using: :gist
    t.index ["municipality_id"], name: "index_municipality_areas_on_municipality_id"
  end

  create_table "rivers", force: :cascade do |t|
    t.geometry "line", limit: {:srid=>3857, :type=>"line_string"}, null: false
    t.index ["line"], name: "index_rivers_on_line", using: :gist
  end

  add_foreign_key "municipality_areas", "municipalities"
end
