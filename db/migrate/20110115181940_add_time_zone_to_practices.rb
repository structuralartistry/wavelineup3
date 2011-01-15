class AddTimeZoneToPractices < ActiveRecord::Migration
  def self.up
    add_column :practices, :time_zone, :string
    
    # update existing practices
    Practice.all.each do |practice|
      practice.time_zone = 'Eastern Time (US & Canada)' if !time_zone
      practice.save
    end
  end

  def self.down
    remove_column :practices, :time_zone
  end
end
