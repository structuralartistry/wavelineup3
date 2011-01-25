class Lineup
  
  def initialize(duration_of_stay_minutes)
    @duration_of_stay = duration_of_stay_minutes
  end
  
  def <<(practice_member_id)
    add_practice_member(practice_member_id)
  end
  
  def current
    # remove practice members exceeding threshold
    practice_members.keys.each do |practice_member_id|
      if practice_members[practice_member_id][:entry_time] < (DateTime.now-@duration_of_stay.minutes)
        practice_members.delete(practice_member_id)
      end
    end
    practice_members.keys
  end
  
  
  private
  
  # here so we can fudge with the figure for tests
  def duration_of_stay=(minutes)
    @duration_of_stay = minutes
  end
  
  def add_practice_member(id)
    @practice_members = {} if !@practice_members
    @practice_members.delete(id) if @practice_members[id] # remove if exists as will get a new start time now as has been access again
    @practice_members[id] = {:entry_time => DateTime.now} 
  end
  
  def practice_members
    @practice_members
  end
  
end