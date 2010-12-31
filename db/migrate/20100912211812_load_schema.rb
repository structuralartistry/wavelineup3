class LoadSchema < ActiveRecord::Migration
  def self.up

    create_table "feedback_supports", :force => true do |t|
      t.integer  "user_id"
      t.text     "message"
      t.string   "location_in_application"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "invitations", :force => true do |t|
      t.string   "email"
      t.integer  "referring_user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "practice_members", :force => true do |t|
      t.integer  "practice_id"
      t.string   "last_name"
      t.string   "first_name"
      t.string   "middle_name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "practices", :force => true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "roles", :force => true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "system_errors", :force => true do |t|
      t.integer  "user_id"
      t.string   "error"
      t.text     "incidentals"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "travel_cards", :force => true do |t|
      t.integer  "practice_member_id"
      t.string   "dominant_occiput"
      t.string   "level_of_care"
      t.string   "full_respiratory_wave"
      t.string   "leading_bme_strategy"
      t.string   "second_bme_strategy"
      t.string   "gateway_occ_c1"
      t.string   "gateway_c1_occ"
      t.string   "gateway_c1_c2"
      t.string   "gateway_c2_c1"
      t.string   "gateway_c2_c3"
      t.string   "gateway_c3_c2"
      t.string   "gateway_c3_c4"
      t.string   "gateway_c4_c3"
      t.string   "gateway_c4_c5"
      t.string   "gateway_c5_c4"
      t.string   "gateway_c5_c6"
      t.string   "gateway_c6_c5"
      t.string   "gateway_c6_c7"
      t.string   "gateway_c7_c6"
      t.string   "gateway_c7_t1"
      t.string   "gateway_t1_c7"
      t.string   "gateway_t1_t2"
      t.string   "gateway_t2_t1"
      t.string   "gateway_t2_t3"
      t.string   "gateway_t3_t2"
      t.string   "gateway_s1"
      t.string   "gateway_s2"
      t.string   "gateway_s3"
      t.string   "gateway_s4"
      t.string   "gateway_s5"
      t.string   "gateway_cx"
      t.string   "passive_c1_c7_tension_level"
      t.string   "passive_t1_t12_tension_level"
      t.string   "passive_l1_l5_tension_level"
      t.string   "passive_s1_cx_tension_level"
      t.string   "active_c1_c7_tension_level"
      t.string   "active_t1_t12_tension_level"
      t.string   "active_l1_l5_tension_level"
      t.string   "active_s1_cx_tension_level"
      t.string   "sri_position_1_level_of_awareness"
      t.string   "sri_position_2_level_of_awareness"
      t.string   "sri_position_3_level_of_awareness"
      t.string   "sri_safety_position"
      t.string   "buzz_words_for_sri"
      t.string   "book_12_stages"
      t.string   "book_healing_magic"
      t.string   "number_gate"
      t.string   "number_hip"
      t.string   "number_ultima"
      t.string   "number_ultimatum"
      t.string   "number_sri"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.text     "notes"
    end

    create_table "users", :force => true do |t|
      t.string   "email"
      t.string   "crypted_password"
      t.string   "password_salt"
      t.string   "persistence_token"
      t.integer  "login_count"
      t.integer  "failed_login_count"
      t.datetime "last_request_at"
      t.datetime "current_login_at"
      t.datetime "last_login_at"
      t.datetime "current_login_ip"
      t.datetime "last_login_ip"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "perishable_token",   :default => "", :null => false
      t.integer  "practice_id"
      t.integer  "role_id"
      t.boolean  "active"
    end

    create_table "visits", :force => true do |t|
      t.integer  "practice_member_id"
      t.date     "date"
      t.string   "phase_1"
      t.string   "phase_1_gateway_1"
      t.string   "phase_1_gateway_2"
      t.string   "phase_1_gateway_1_affecting"
      t.string   "phase_1_gateway_2_affecting"
      t.string   "phase_1_level_of_care"
      t.string   "phase_1_direction"
      t.string   "phase_2"
      t.string   "phase_2_gateway_1"
      t.string   "phase_2_gateway_2"
      t.string   "phase_2_gateway_1_affecting"
      t.string   "phase_2_gateway_2_affecting"
      t.string   "phase_2_level_of_care"
      t.string   "phase_2_direction"
      t.string   "sri_stage"
      t.string   "sri_position"
      t.string   "sri_level_of_care"
      t.string   "sri_organizing_field"
      t.string   "short_leg_side"
      t.string   "short_leg_amount"
      t.string   "heel_tension_level"
      t.string   "eversion_tension_level"
      t.string   "abduction_tension_level"
      t.string   "adduction_tension_level"
      t.string   "ingression_organizing_field"
      t.string   "egression_organizing_field"
      t.string   "long_lever_arm"
      t.string   "short_lever_arm"
      t.string   "crest"
      t.string   "diagnosis"
      t.text     "notes"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

  end

  def self.down
    drop_table :users
  end
end
