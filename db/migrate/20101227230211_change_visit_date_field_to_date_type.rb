class ChangeVisitDateFieldToDateType < ActiveRecord::Migration
  def self.up
    change_column :visits, :date, :date
  end

  def self.down
  end
end
