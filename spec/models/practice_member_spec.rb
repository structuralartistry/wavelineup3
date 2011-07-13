require 'spec_helper'

describe PracticeMember do

  before(:each) do
    @practice = Factory.create(:practice_one)

    @practice_member = Factory.create(:practice_member)
    @practice_member.practice_id = @practice.id
    @practice_member.save
  end

  it { should belong_to(:practice) }
  it { should have_one(:travel_card) }

  it { should validate_presence_of(:practice_id) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:first_name) }

  # it { should validate_uniqueness_of(:first_name).scoped_to(:last_name, :middle_name).message('first_name has already been taken in combination with this middle and last name.') }
  it "should have a name combination unique to the practice" do
    new_practice_member = @practice_member.dup
    new_practice_member.valid?
    new_practice_member.errors[:first_name][0].should == 'has already been taken in combination with this middle and last name.'

    new_practice_member = @practice_member.dup
    new_practice_member.valid?
    new_practice_member.errors[:first_name][0].should == 'has already been taken in combination with this middle and last name.'

    second_practice = Factory.create(:practice_two)
    new_practice_member.practice_id = second_practice.id
    new_practice_member.valid?.should == true
  end

  ['Billy', 'bob', 'Billy-Bob', 'billy bob', "O'Kelley"].each do |good_name|
    it { should allow_value(good_name).for(:first_name) }
    it { should allow_value(good_name).for(:last_name) }
    it { should allow_value(good_name).for(:middle_name) }
  end

  ['Billy1', 'bob#', 'Billy*Bob', 'billy. bob'].each do |bad_name|
    it { should_not allow_value(bad_name).for(:first_name) }
    it { should_not allow_value(bad_name).for(:last_name) }
    it { should_not allow_value(bad_name).for(:middle_name) }
  end

  it "can get global practice member count not including Demo Practice" do
    assert_equal PracticeMember.practice_members_global_count, 1
  end

  describe "practice member list text" do
    it "should format in Last Name, First Name Middle Name format" do
      practice_member = PracticeMember.new
      practice_member.last_name = "Kahn"
      practice_member.first_name = "David"
      practice_member.middle_name = "Nathan"
      practice_member.full_name_last_comma_first_middle_initial.should == "Kahn, David N"
    end

    it "should strip empty characters from start and end" do
      practice_member = PracticeMember.new
      practice_member.last_name = "Kahn"
      practice_member.first_name = "David"
      practice_member.middle_name = ""
      practice_member.full_name_last_comma_first_middle_initial.should == "Kahn, David"
    end
  end

  describe "create new Practice Member" do

    it "gets a Travel Card record automatically" do
      practice_member = Factory.create(:practice_member)
      TravelCard.find_by_practice_member_id(practice_member.id).practice_member_id.should == practice_member.id
    end

  end

  describe "get Practice Members" do
    it "should only return Practice Members assigned to the current user's Practice" do
      practice_two = Factory.create(:practice_two)
      practice_member_practice_two = Factory.create(:practice_member, :practice_id => practice_two.id)

      current_user = Factory.create(:practice_admin_user, :practice_id => @practice.id)

      returned_practice_members = PracticeMember.get_all_restricted_by_user(current_user)
      returned_practice_members.size.should == 1
      returned_practice_members.should == [@practice_member]
    end
  end

  describe "get practice member" do
    it "should only return Practice Members if the practice member belongs to the current user's practice" do
      practice_two = Factory.create(:practice_two)
      practice_member_practice_two = Factory.create(:practice_member, :practice_id => practice_two.id)

      current_user = Factory.create(:practice_admin_user, :practice_id => @practice.id)

      # should return member of own practice
      returned_practice_member = PracticeMember.get_by_id_restricted_by_user(@practice_member.id, current_user)
      returned_practice_member.should == @practice_member

      # should not return member of other practice
      returned_practice_member = PracticeMember.get_by_id_restricted_by_user(practice_member_practice_two.id, current_user)
      returned_practice_member.should == nil
    end
  end

  it "deletes related records (Travel Card and Visit) when destroyed" do
    practice_member = Factory.create(:practice_member)
    travel_card_id = TravelCard.find_by_practice_member_id(practice_member.id).id
    visit = Factory.create(:visit)
    visit.practice_member_id = practice_member.id
    visit.save!

    practice_member.destroy
    TravelCard.where("practice_member_id=#{practice_member.id}").all.should == []
    Visit.where("practice_member_id=#{practice_member.id}").all.should == []
  end

  it "should return lineup practice members as those who have been accessed in the practice room within the lineup threshold" do
    PracticeMember.lineup_practice_members(@practice.id).count.should == 0

    @practice_member.last_practice_room_access = DateTime.now
    @practice_member.save

    PracticeMember.lineup_practice_members(@practice.id).count.should == 1

    @practice_member.last_practice_room_access = DateTime.now - (LINEUP_DURATION_OF_STAY_MINUTES+2).minutes
    @practice_member.save

    PracticeMember.lineup_practice_members(@practice.id).count.should == 0
  end

  it "should only return lineup practice members for the current users practice" do
    PracticeMember.lineup_practice_members(@practice.id).count.should == 0
    @practice_member.last_practice_room_access = DateTime.now
    @practice_member.save
    PracticeMember.lineup_practice_members(@practice.id).count.should == 1

    practice = Factory.create(:practice_two)
    practice_member = Factory.create(:practice_member, :practice => practice)
    PracticeMember.count.should == 2
    PracticeMember.lineup_practice_members(practice.id).count.should == 0
    practice_member.last_practice_room_access = DateTime.now
    practice_member.save
    PracticeMember.lineup_practice_members(practice.id).count.should == 1
  end

end
