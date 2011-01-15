class ChangeVisitEntrainmentDateFieldToDateTimeAndRename < ActiveRecord::Migration
  def self.up
    rename_column :visits, :entrainment_date, :date
    change_column :visits, :date, :datetime
  end

  def self.down
  end
end
