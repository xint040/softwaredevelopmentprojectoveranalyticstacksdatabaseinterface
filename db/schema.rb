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

ActiveRecord::Schema[7.1].define(version: 2024_03_19_202629) do
  create_table "fundamental_questions", force: :cascade do |t|
    t.string "fundamental_questions_proposing_author"
    t.string "fundamental_questions_proposing_date"
    t.string "fundamental_questions_proposing_text"
    t.string "fundamental_questions_proposing_references"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grothendieck_sites_categories", force: :cascade do |t|
    t.string "grothendieck_sites_description"
    t.string "grothendieck_topologies"
    t.string "underlying_rings_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learners_discussions", force: :cascade do |t|
    t.string "learners_discussions_date"
    t.string "learners_discussions_text"
    t.string "learners_discussions_references"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learners_notes", force: :cascade do |t|
    t.integer "reader_id"
    t.string "learners_notes_title"
    t.string "learners_notes_date"
    t.string "learners_notes_description"
    t.string "learners_notes_text"
    t.string "learners_notes_more_things_want_to_learn_on_analytic_stacks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reader_id"], name: "index_learners_notes_on_reader_id"
  end

  create_table "prestacks_as_the_presheaves_categories", force: :cascade do |t|
    t.string "prestacks_as_the_presheaves_categories_description"
    t.string "prestacks_as_the_presheaves_categories_target_categories"
    t.string "underlying_grothendieck_sites_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_readers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_readers_on_reset_password_token", unique: true
  end

  create_table "references", force: :cascade do |t|
    t.string "references_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rings_categories", force: :cascade do |t|
    t.string "rings_categories_description"
    t.string "rings_categories_charactaristics"
    t.string "indseminormed"
    t.string "indnormed"
    t.string "indBanach"
    t.string "monomorphicindseminormed"
    t.string "monomorphicindnormed"
    t.string "monomorphicindBanach"
    t.string "condensed"
    t.string "Clausen_Scholze_analytic_1_more_adic_style"
    t.string "Clausen_Scholze_analytic_2_more_categorical_flavor"
    t.string "adic"
    t.string "perfectoid"
    t.string "topologies_on_the_rings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stacks_as_the_sheaves_categories", force: :cascade do |t|
    t.string "stacks_as_the_sheaves_categories_description"
    t.string "stacks_as_the_sheaves_categories_target_categories"
    t.string "stacks_as_the_sheaves_categories_over_topologies_can_be_realized"
    t.string "sheafification_from_the_prestacks_as_the_presheaves_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stylish_applications", force: :cascade do |t|
    t.string "stylish_applications_title"
    t.string "stylish_applications_related_authors"
    t.string "stylish_applications_related_text"
    t.string "stylish_applications_references"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
