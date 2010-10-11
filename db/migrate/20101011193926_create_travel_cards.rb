class CreateTravelCards < ActiveRecord::Migration
  def self.up
    create_table :travel_cards do |t|
      t.integer :practice_member_id
      t.string :dominant_occiput
      t.string :level_of_care
      t.string :full_respiratory_wave
      t.string :leading_bme_strategy
      t.string :second_bme_strategy
      t.string :gateway_occ_c1
      t.string :gateway_c1_occ
      t.string :gateway_c1_c2
      t.string :gateway_c2_c1
      t.string :gateway_c2_c3
      t.string :gateway_c3_c2
      t.string :gateway_c3_c4
      t.string :gateway_c4_c3
      t.string :gateway_c4_c5
      t.string :gateway_c5_c4
      t.string :gateway_c5_c6
      t.string :gateway_c6_c5
      t.string :gateway_c6_c7
      t.string :gateway_c7_c6
      t.string :gateway_c7_t1
      t.string :gateway_t1_c7
      t.string :gateway_t1_t2
      t.string :gateway_t2_t1
      t.string :gateway_t2_t3
      t.string :gateway_t3_t2
      t.string :gateway_s1
      t.string :gateway_s2
      t.string :gateway_s3
      t.string :gateway_s4
      t.string :gateway_s5
      t.string :gateway_cx
      t.string :passive_c1_c7_tension_level
      t.string :passive_t1_t12_tension_level
      t.string :passive_l1_l5_tension_level
      t.string :passive_s1_cx_tension_level
      t.string :active_c1_c7_tension_level
      t.string :active_t1_t12_tension_level
      t.string :active_l1_l5_tension_level
      t.string :active_s1_cx_tension_level
      t.string :sri_position_1_level_of_awareness
      t.string :sri_position_2_level_of_awareness
      t.string :sri_position_3_level_of_awareness
      t.string :sri_safety_position
      t.string :buzz_words_for_sri
      t.string :book_12_stages
      t.string :book_healing_magic
      t.string :number_gate
      t.string :number_hip
      t.string :number_ultima
      t.string :number_ultimatum
      t.string :number_sri

      t.timestamps
    end
  end

  def self.down
    drop_table :travel_cards
  end
end
