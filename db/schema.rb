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

ActiveRecord::Schema.define(version: 20160606223646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "absences", force: :cascade do |t|
    t.integer  "student_school_year_id", null: false
    t.datetime "occurred_at",            null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "absences", ["student_school_year_id"], name: "index_absences_on_student_school_year_id", using: :btree

  create_table "assessment_families", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assessment_subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assessments", force: :cascade do |t|
    t.string   "name"
    t.string   "family"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discipline_incidents", force: :cascade do |t|
    t.string   "incident_code"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "incident_location"
    t.text     "incident_description"
    t.datetime "occurred_at",            null: false
    t.boolean  "has_exact_time"
    t.integer  "student_school_year_id", null: false
  end

  add_index "discipline_incidents", ["student_school_year_id"], name: "index_discipline_incidents_on_student_school_year_id", using: :btree

  create_table "discontinued_services", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "recorded_by_educator_id"
    t.datetime "recorded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educators", force: :cascade do |t|
    t.string   "email",                                   default: "",    null: false
    t.string   "encrypted_password",                      default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                                   default: false
    t.string   "phone"
    t.string   "full_name"
    t.string   "state_id"
    t.string   "local_id"
    t.string   "staff_type"
    t.integer  "school_id"
    t.boolean  "schoolwide_access",                       default: false, null: false
    t.string   "grade_level_access",                      default: [],                 array: true
    t.boolean  "restricted_to_sped_students",             default: false, null: false
    t.boolean  "restricted_to_english_language_learners", default: false, null: false
    t.boolean  "can_view_restricted_notes",               default: false, null: false
  end

  add_index "educators", ["grade_level_access"], name: "index_educators_on_grade_level_access", using: :gin
  add_index "educators", ["reset_password_token"], name: "index_educators_on_reset_password_token", unique: true, using: :btree

  create_table "event_note_revisions", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "educator_id"
    t.integer  "event_note_type_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_note_id"
    t.integer  "version"
  end

  create_table "event_note_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_notes", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "educator_id"
    t.integer  "event_note_type_id"
    t.text     "text"
    t.datetime "recorded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_restricted",      default: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "homerooms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "students_count", default: 0, null: false
    t.integer  "educator_id"
    t.string   "slug"
    t.string   "grade"
    t.integer  "school_id"
  end

  add_index "homerooms", ["educator_id"], name: "index_homerooms_on_educator_id", using: :btree
  add_index "homerooms", ["name"], name: "index_homerooms_on_name", unique: true, using: :btree
  add_index "homerooms", ["slug"], name: "index_homerooms_on_slug", unique: true, using: :btree

  create_table "intervention_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interventions", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "intervention_type_id"
    t.text     "comment"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "educator_id"
    t.integer  "number_of_hours"
    t.integer  "school_year_id"
    t.text     "goal"
    t.integer  "student_school_year_id"
    t.string   "custom_intervention_name"
  end

  create_table "precomputed_query_docs", force: :cascade do |t|
    t.text     "key"
    t.text     "json"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "precomputed_query_docs", ["key"], name: "index_precomputed_query_docs_on_key", unique: true, using: :btree

  create_table "school_years", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start"
  end

  create_table "schools", force: :cascade do |t|
    t.integer  "state_id"
    t.string   "school_type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "local_id"
    t.string   "slug"
  end

  add_index "schools", ["local_id"], name: "index_schools_on_local_id", using: :btree
  add_index "schools", ["state_id"], name: "index_schools_on_state_id", using: :btree

  create_table "service_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "recorded_by_educator_id"
    t.integer  "service_type_id"
    t.datetime "recorded_at"
    t.datetime "date_started"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provided_by_educator_name"
  end

  create_table "student_assessments", force: :cascade do |t|
    t.integer  "scale_score"
    t.integer  "growth_percentile"
    t.string   "performance_level"
    t.datetime "date_taken"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "percentile_rank"
    t.decimal  "instructional_reading_level"
    t.integer  "school_year_id"
    t.integer  "assessment_id"
    t.integer  "student_school_year_id"
  end

  add_index "student_assessments", ["school_year_id"], name: "index_student_assessments_on_school_year_id", using: :btree
  add_index "student_assessments", ["student_id"], name: "index_student_assessments_on_student_id", using: :btree

  create_table "student_risk_levels", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mcas_math_risk_level"
    t.integer  "star_math_risk_level"
    t.integer  "mcas_ela_risk_level"
    t.integer  "star_reading_risk_level"
    t.integer  "limited_english_proficiency_risk_level"
  end

  create_table "student_school_years", force: :cascade do |t|
    t.integer  "student_id",     null: false
    t.integer  "school_year_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "student_school_years", ["student_id", "school_year_id"], name: "index_student_school_years_on_student_id_and_school_year_id", unique: true, using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "grade"
    t.boolean  "hispanic_latino"
    t.string   "race"
    t.string   "free_reduced_lunch"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "homeroom_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "state_id"
    t.string   "home_language"
    t.integer  "school_id"
    t.string   "student_address"
    t.datetime "registration_date"
    t.string   "local_id"
    t.string   "program_assigned"
    t.string   "sped_placement"
    t.string   "disability"
    t.string   "sped_level_of_need"
    t.string   "plan_504"
    t.string   "limited_english_proficiency"
    t.integer  "most_recent_mcas_math_growth"
    t.integer  "most_recent_mcas_ela_growth"
    t.string   "most_recent_mcas_math_performance"
    t.string   "most_recent_mcas_ela_performance"
    t.integer  "most_recent_mcas_math_scaled"
    t.integer  "most_recent_mcas_ela_scaled"
    t.integer  "most_recent_star_reading_percentile"
    t.integer  "most_recent_star_math_percentile"
    t.string   "enrollment_status"
    t.datetime "date_of_birth"
  end

  add_index "students", ["homeroom_id"], name: "index_students_on_homeroom_id", using: :btree
  add_index "students", ["local_id"], name: "index_students_on_local_id", using: :btree
  add_index "students", ["school_id"], name: "index_students_on_school_id", using: :btree
  add_index "students", ["state_id"], name: "index_students_on_state_id", using: :btree

  create_table "tardies", force: :cascade do |t|
    t.integer  "student_school_year_id", null: false
    t.datetime "occurred_at",            null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tardies", ["student_school_year_id"], name: "index_tardies_on_student_school_year_id", using: :btree

end
