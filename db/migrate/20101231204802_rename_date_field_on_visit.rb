class RenameDateFieldOnVisit < ActiveRecord::Migration
  def self.up
    rename_column :visits, :date, :entrainment_date
  end

  def self.down
  end
end
