class CreatePracticeMemberVisits < ActiveRecord::Migration
  def self.up
    create_table :practice_member_visits do |t|
      t.integer :practice_member_id
      t.datetime :date
      t.string :phase_1
      t.string :phase_1_gateway_1
      t.string :phase_1_gateway_2
      t.string :phase_1_gateway_1_affecting
      t.string :phase_1_gateway_2_affecting
      t.string :phase_1_level_of_care
      t.string :phase_1_direction
      t.string :phase_2
      t.string :phase_2_gateway_1
      t.string :phase_2_gateway_2
      t.string :phase_2_gateway_1_affecting
      t.string :phase_2_gateway_2_affecting
      t.string :phase_2_level_of_care
      t.string :phase_2_direction
      t.string :sri_stage
      t.string :sri_position
      t.string :sri_level_of_care
      t.string :sri_organizing_field
      t.string :short_leg_side
      t.string :short_leg_amount
      t.string :heel_tension_level
      t.string :eversion_tension_level
      t.string :abduction_tension_level
      t.string :adduction_tension_level
      t.string :ingression_organizing_field
      t.string :egression_organizing_field
      t.string :long_lever_arm
      t.string :short_lever_arm
      t.string :crest
      t.string :diagnosis
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :practice_member_visits
  end
end
