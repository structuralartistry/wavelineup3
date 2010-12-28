class ChangePracticeMemberVisitDateFieldToDateType < ActiveRecord::Migration
  def self.up
    change_column :practice_member_visits, :date, :date
  end

  def self.down
  end
end
