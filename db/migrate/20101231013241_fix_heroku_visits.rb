class FixHerokuVisits < ActiveRecord::Migration
  def self.up
    rename_table :practice_member_visits, :visits
  end

  def self.down
  end
end
