class RenameSriPosFieldAndAddSecondToVisit < ActiveRecord::Migration
  def self.up
    rename_column :visits, :sri_position, :sri_position_a
    add_column :visits, :sri_position_b, :string
  end

  def self.down
  end
end
