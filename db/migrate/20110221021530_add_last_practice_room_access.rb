class AddLastPracticeRoomAccess < ActiveRecord::Migration
  def self.up
    add_column :practice_members, :last_practice_room_access, :datetime
  end

  def self.down
  end
end
