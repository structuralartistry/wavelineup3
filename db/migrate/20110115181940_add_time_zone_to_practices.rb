class AddTimeZoneToPractices < ActiveRecord::Migration
  def self.up
    add_column :practices, :time_zone, :string
  end

  def self.down
    remove_column :practices, :time_zone
  end
end
