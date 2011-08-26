class AddAndRenameSriSessionFieldsToAddMoreSessionsOnVisit < ActiveRecord::Migration
  def change
    rename_column :visits, :sri_stage, :sri_session_1_stage
    rename_column :visits, :sri_position_a, :sri_session_1_position_a
    rename_column :visits, :sri_position_b, :sri_session_1_position_b
    rename_column :visits, :sri_level_of_care, :sri_session_1_level_of_care
    rename_column :visits, :sri_organizing_field, :sri_session_1_organizing_field

    add_column :visits, :sri_session_2_stage, :string
    add_column :visits, :sri_session_2_position_a, :string
    add_column :visits, :sri_session_2_position_b, :string
    add_column :visits, :sri_session_2_level_of_care, :string
    add_column :visits, :sri_session_2_organizing_field, :string

    add_column :visits, :sri_session_3_stage, :string
    add_column :visits, :sri_session_3_position_a, :string
    add_column :visits, :sri_session_3_position_b, :string
    add_column :visits, :sri_session_3_level_of_care, :string
    add_column :visits, :sri_session_3_organizing_field, :string
  end
end
