class AddReferringPracticeIdToPractices < ActiveRecord::Migration
  def self.up
    add_column :practices, :referring_practice_id, :integer
  end

  def self.down
    remove_column :practices, :referring_practice_id
  end
end
