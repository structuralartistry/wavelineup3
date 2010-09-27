class AddPracticeIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :practice_id, :integer
  end

  def self.down
    remove_column :users, :practice_id
  end
end
