require 'test_helper'

class PracticeMemberTest < Test::Unit::TestCase 
debugger
  context "practice member" do     
    should "get global practice member count not including Demo Practice" do
      assert_equal PracticeMember.practice_members_global_count, 0

      practice = Factory.create(:practice_one)

      practice_member = Factory.create(:practice_member)
      practice_member.practice_id = practice.id
      practice_member.save
      practice_member = Factory.create(:practice_member)
      practice_member.practice_id = practice.id
      practice_member.save

      assert_equal PracticeMember.practice_members_global_count, 2
    end
  end 
end
