class CreateFeedbackSupports < ActiveRecord::Migration
  def self.up
    create_table :feedback_supports do |t|
      t.integer :user_id
      t.text :message
      t.string :location_in_application

      t.timestamps
    end
  end

  def self.down
    drop_table :feedback_supports
  end
end
