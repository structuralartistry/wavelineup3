class UpdatePracticesTimeZone < ActiveRecord::Migration
  def self.up
    # update existing practices
    Practice.all.each do |practice|
      practice.time_zone = 'Eastern Time (US & Canada)' if !practice.time_zone
      practice.save
    end
  end

  def self.down
  end
end
