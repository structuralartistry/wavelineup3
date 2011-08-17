require 'spec_helper'

describe User do

  before(:all) do
    Factory.create(:sysadmin_role)
    Factory.create(:practice_admin_role)
    Factory.create(:practice_user_role)
  end

  before(:each) do
    practice = Factory.create(:practice_one)
    Factory.create(:practice_admin_user, :practice_id => practice.id)
  end

  it { should belong_to(:practice) }
  it { should belong_to(:role) }
  it { should have_many(:invitations) }
  it { should have_many(:system_errors) }
  it { should have_many(:feedback_supports) }
  it { should have_many(:logins) }

  it { should validate_presence_of(:role) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value('david.nathan_kahn@gmail.com.mx').for(:email) }
  it { should_not allow_value('david nathan kahn at gmail dot com').for(:email) }

  it { should allow_value('Passwor1').for(:password) }
  it { should_not allow_value('passwor1').for(:password)}
  it { should_not allow_value('password').for(:password)}
  it { should_not allow_value('pass').for(:password)}
  it { should_not allow_value('11111111').for(:password)}

  it "should validate password confirmation matches" do
    user = Factory.build(:user)
    user.password = STANDARD_TEST_PASSWORD
    user.password_confirmation = BAD_STANDARD_TEST_PASSWORD
    user.valid?.should == false
    user.errors[:password].empty?.should eq(false)
  end

  it { should_not allow_mass_assignment_of(:crypted_password)}
  it { should_not allow_mass_assignment_of(:password_salt)}
  it { should_not allow_mass_assignment_of(:practice_id)}
  it { should_not allow_mass_assignment_of(:role_id)}
  it { should_not allow_mass_assignment_of(:active)}

  # at some point maybe turn the below into a matrix using this format:
  # controller action guest sysadmin admin pruser
  # 'activations', 'create', true, false, false, false

  describe "user authorization - guest role" do
    it "is authorized to access certain pages only" do
      user = User.new
      user.authorize('activations', 'create')[:success].should == true
      user.authorize('feature_requests', 'index')[:success].should == false
      user.authorize('feature_requests', 'new')[:success].should == false
      user.authorize('feature_requests', 'edit')[:success].should == false
      user.authorize('feature_requests', 'create')[:success].should == false
      user.authorize('feature_requests', 'update')[:success].should == false
      user.authorize('feature_requests', 'destroy')[:success].should == false
      user.authorize('feedback_supports', 'create')[:success].should == false
      user.authorize('home', 'index')[:success].should == false
      user.authorize('home', 'terms_of_service')[:success].should == true
      user.authorize('home', 'privacy_policy')[:success].should == true
      user.authorize('home', 'about')[:success].should == true
      user.authorize('invitations', 'create')[:success].should == false
      user.authorize('logins', 'new')[:success].should == true
      user.authorize('logins', 'create')[:success].should == true
      user.authorize('logins', 'destroy')[:success].should == false
      user.authorize('password_resets', 'new')[:success].should == true
      user.authorize('password_resets', 'create')[:success].should == true
      user.authorize('password_resets', 'edit')[:success].should == true
      user.authorize('password_resets', 'update')[:success].should == true
      user.authorize('practice_members', 'index')[:success].should == false
      user.authorize('practice_members', 'new')[:success].should == false
      user.authorize('practice_members', 'edit')[:success].should == false
      user.authorize('practice_members', 'create')[:success].should == false
      user.authorize('practice_members', 'update')[:success].should == false
      user.authorize('practice_members', 'destroy')[:success].should == false
      user.authorize('practice_room', 'main')[:success].should == false
      user.authorize('practices', 'index')[:success].should == false
      user.authorize('practices', 'new')[:success].should == true
      user.authorize('practices', 'edit')[:success].should == false
      user.authorize('practices', 'create')[:success].should == true
      user.authorize('practices', 'update')[:success].should == false
      user.authorize('practices', 'confirm_delete')[:success].should == false
      user.authorize('practices', 'destroy')[:success].should == false
      user.authorize('reports', 'index')[:success].should == false
      user.authorize('reports', 'show')[:success].should == false
      user.authorize('travel_cards', 'edit')[:success].should == false
      user.authorize('travel_cards', 'update')[:success].should == false
      user.authorize('users', 'new')[:success].should == false
      user.authorize('users', 'edit')[:success].should == false
      user.authorize('users', 'create')[:success].should == false
      user.authorize('users', 'update')[:success].should == false
      user.authorize('users', 'destroy')[:success].should == false
      user.authorize('visits', 'update')[:success].should == false
    end
  end

  describe "user authorization - sysadmin role" do
    it "is authorized to access certain pages only" do
      user = Factory.create(:sysadmin_user)
      user.authorize('activations', 'create')[:success].should == false
      user.authorize('feature_requests', 'index')[:success].should == true
      user.authorize('feature_requests', 'new')[:success].should == true
      user.authorize('feature_requests', 'edit')[:success].should == true
      user.authorize('feature_requests', 'create')[:success].should == true
      user.authorize('feature_requests', 'update')[:success].should == true
      user.authorize('feature_requests', 'destroy')[:success].should == true
      user.authorize('feedback_supports', 'create')[:success].should == false
      user.authorize('home', 'index')[:success].should == true
      user.authorize('home', 'terms_of_service')[:success].should == true
      user.authorize('home', 'privacy_policy')[:success].should == true
      user.authorize('home', 'about')[:success].should == true
      user.authorize('invitations', 'create')[:success].should == false
      user.authorize('logins', 'new')[:success].should == false
      user.authorize('logins', 'create')[:success].should == false
      user.authorize('logins', 'destroy')[:success].should == true
      user.authorize('password_resets', 'new')[:success].should == false
      user.authorize('password_resets', 'create')[:success].should == false
      user.authorize('password_resets', 'edit')[:success].should == false
      user.authorize('password_resets', 'update')[:success].should == false
      user.authorize('practice_members', 'index')[:success].should == true
      user.authorize('practice_members', 'new')[:success].should == true
      user.authorize('practice_members', 'edit')[:success].should == true
      user.authorize('practice_members', 'create')[:success].should == true
      user.authorize('practice_members', 'update')[:success].should == true
      user.authorize('practice_members', 'destroy')[:success].should == true
      user.authorize('practice_room', 'main')[:success].should == false
      user.authorize('practices', 'index')[:success].should == true
      user.authorize('practices', 'new')[:success].should == false
      user.authorize('practices', 'edit')[:success].should == true
      user.authorize('practices', 'create')[:success].should == false
      user.authorize('practices', 'update')[:success].should == true
      user.authorize('practices', 'confirm_delete')[:success].should == false
      user.authorize('practices', 'destroy')[:success].should == false
      user.authorize('reports', 'index')[:success].should == false
      user.authorize('reports', 'show')[:success].should == false
      user.authorize('travel_cards', 'edit')[:success].should == true
      user.authorize('travel_cards', 'update')[:success].should == true
      user.authorize('users', 'new')[:success].should == true
      user.authorize('users', 'edit')[:success].should == true
      user.authorize('users', 'create')[:success].should == true
      user.authorize('users', 'update')[:success].should == true
      user.authorize('users', 'destroy')[:success].should == true
      user.authorize('visits', 'update')[:success].should == false
    end
  end

  describe "user authorization - practice admin role" do
    it "is authorized to access certain pages only" do
      user = Factory.create(:practice_admin_user)
      user.authorize('activations', 'create')[:success].should == false
      user.authorize('feature_requests', 'index')[:success].should == true
      user.authorize('feature_requests', 'new')[:success].should == false
      user.authorize('feature_requests', 'edit')[:success].should == false
      user.authorize('feature_requests', 'create')[:success].should == false
      user.authorize('feature_requests', 'update')[:success].should == false
      user.authorize('feature_requests', 'destroy')[:success].should == false
      user.authorize('feedback_supports', 'create')[:success].should == true
      user.authorize('home', 'index')[:success].should == true
      user.authorize('home', 'terms_of_service')[:success].should == true
      user.authorize('home', 'privacy_policy')[:success].should == true
      user.authorize('home', 'about')[:success].should == true
      user.authorize('invitations', 'create')[:success].should == true
      user.authorize('logins', 'new')[:success].should == false
      user.authorize('logins', 'create')[:success].should == false
      user.authorize('logins', 'destroy')[:success].should == true
      user.authorize('password_resets', 'new')[:success].should == false
      user.authorize('password_resets', 'create')[:success].should == false
      user.authorize('password_resets', 'edit')[:success].should == false
      user.authorize('password_resets', 'update')[:success].should == false
      user.authorize('practice_members', 'index')[:success].should == true
      user.authorize('practice_members', 'new')[:success].should == true
      user.authorize('practice_members', 'edit')[:success].should == true
      user.authorize('practice_members', 'create')[:success].should == true
      user.authorize('practice_members', 'update')[:success].should == true
      user.authorize('practice_members', 'destroy')[:success].should == true
      user.authorize('practice_room', 'main')[:success].should == true
      user.authorize('practices', 'index')[:success].should == false
      user.authorize('practices', 'new')[:success].should == false
      user.authorize('practices', 'edit')[:success].should == true
      user.authorize('practices', 'create')[:success].should == false
      user.authorize('practices', 'update')[:success].should == true
      user.authorize('practices', 'confirm_delete')[:success].should == true
      user.authorize('practices', 'destroy')[:success].should == true
      user.authorize('reports', 'index')[:success].should == true
      user.authorize('reports', 'show')[:success].should == true
      user.authorize('travel_cards', 'edit')[:success].should == true
      user.authorize('travel_cards', 'update')[:success].should == true
      user.authorize('users', 'new')[:success].should == true
      user.authorize('users', 'edit')[:success].should == true
      user.authorize('users', 'create')[:success].should == true
      user.authorize('users', 'update')[:success].should == true
      user.authorize('users', 'destroy')[:success].should == true
      user.authorize('visits', 'update')[:success].should == true
    end
  end

  describe "user authorization - practice user role" do
    it "is authorized to access certain pages only" do
      user = Factory.create(:practice_user)
      user.authorize('activations', 'create')[:success].should == false
      user.authorize('feature_requests', 'index')[:success].should == true
      user.authorize('feature_requests', 'new')[:success].should == false
      user.authorize('feature_requests', 'edit')[:success].should == false
      user.authorize('feature_requests', 'create')[:success].should == false
      user.authorize('feature_requests', 'update')[:success].should == false
      user.authorize('feature_requests', 'destroy')[:success].should == false
      user.authorize('feedback_supports', 'create')[:success].should == true
      user.authorize('home', 'index')[:success].should == true
      user.authorize('home', 'terms_of_service')[:success].should == true
      user.authorize('home', 'privacy_policy')[:success].should == true
      user.authorize('home', 'about')[:success].should == true
      user.authorize('invitations', 'create')[:success].should == true
      user.authorize('logins', 'new')[:success].should == false
      user.authorize('logins', 'create')[:success].should == false
      user.authorize('logins', 'destroy')[:success].should == true
      user.authorize('password_resets', 'new')[:success].should == false
      user.authorize('password_resets', 'create')[:success].should == false
      user.authorize('password_resets', 'edit')[:success].should == false
      user.authorize('password_resets', 'update')[:success].should == false
      user.authorize('practice_members', 'index')[:success].should == true
      user.authorize('practice_members', 'new')[:success].should == true
      user.authorize('practice_members', 'edit')[:success].should == true
      user.authorize('practice_members', 'create')[:success].should == true
      user.authorize('practice_members', 'update')[:success].should == true
      user.authorize('practice_members', 'destroy')[:success].should == true
      user.authorize('practice_room', 'main')[:success].should == true
      user.authorize('practices', 'index')[:success].should == false
      user.authorize('practices', 'new')[:success].should == false
      user.authorize('practices', 'edit')[:success].should == true
      user.authorize('practices', 'create')[:success].should == false
      user.authorize('practices', 'update')[:success].should == true
      user.authorize('practices', 'confirm_delete')[:success].should == false
      user.authorize('practices', 'destroy')[:success].should == false
      user.authorize('reports', 'index')[:success].should == true
      user.authorize('reports', 'show')[:success].should == true
      user.authorize('travel_cards', 'edit')[:success].should == true
      user.authorize('travel_cards', 'update')[:success].should == true
      user.authorize('users', 'new')[:success].should == true
      user.authorize('users', 'edit')[:success].should == true
      user.authorize('users', 'create')[:success].should == true
      user.authorize('users', 'update')[:success].should == true
      user.authorize('users', 'destroy')[:success].should == true
      user.authorize('visits', 'update')[:success].should == true
    end
  end


  describe "access to user data" do

    before(:each) do
      User.delete_all
      Practice.delete_all

      practice_one = Factory.create(:practice_one)
      practice_two = Factory.create(:practice_two)

      Factory.create(:practice_admin_user, :practice_id => practice_one.id)
      Factory.create(:practice_user, :practice_id => practice_one.id)
      Factory.create(:practice_admin_user, :practice_id => practice_two.id)
      Factory.create(:practice_user, :practice_id => practice_two.id)
    end

    describe "get users" do

      it "returns nothing if the user is in the guest role" do
        users = User.get_all_restricted_by_user(nil)
        users.should == nil
      end

      it "returns all users if requester is in the sysadmin role" do
        current_user = Factory.create(:sysadmin_user)

        users = User.get_all_restricted_by_user(current_user)
        users.size.should == 5
      end

      it "returns all users associated to the requesters practice if the requester is in the practice admin role" do
        current_user = User.includes("role").limit("1").where("roles.name='practice admin'").first

        users = User.get_all_restricted_by_user(current_user)
        users.size.should == 2
      end

      it "returns all users associated to the requesters practice if the requester is in the practice user role" do
        current_user = User.includes("role").limit("1").where("roles.name='practice user'").first

        users = User.get_all_restricted_by_user(current_user)
        users.size.should == 2
      end
    end

    describe "get user" do
      it "returns nothing if the user is in the guest role" do
        user_to_find = User.includes("role").where("roles.name != 'sysadmin'").first

        returned_user = User.get_by_id_restricted_by_user(user_to_find.id, nil)
        returned_user.should == nil
      end

      it "returns any user if the requester is in the sysadmin role" do
        current_user = Factory.create(:sysadmin_user)

        user_to_find = User.includes("role").where("roles.name!='sysadmin'").first

        returned_user = User.get_by_id_restricted_by_user(user_to_find.id, current_user)
        returned_user.should == user_to_find
      end

      it "returns any user associated to the requesters practice if the requester is in the practice admin role" do
        current_user = User.includes("role").limit("1").where("roles.name='practice admin'").first

        # user in the practice
        user_to_find = User.where("practice_id=#{current_user.practice_id}").first
        returned_user = User.get_by_id_restricted_by_user(user_to_find.id, current_user)
        returned_user.should == user_to_find

        # user not in the practice
        user_to_find = User.where("practice_id!=#{current_user.practice_id}").first
        returned_user = User.get_by_id_restricted_by_user(user_to_find.id, current_user)
        returned_user.should == nil
      end

      it "returns any user associated to the requesters practice if the requester is in the practice user role" do
        current_user = User.includes("role").limit("1").where("roles.name='practice user'").first

        # user in the practice
        user_to_find = User.where("practice_id=#{current_user.practice_id}").first
        returned_user = User.get_by_id_restricted_by_user(user_to_find.id, current_user)
        returned_user.should == user_to_find

        # user not in the practice
        user_to_find = User.where("practice_id!=#{current_user.practice_id}").first
        returned_user = User.get_by_id_restricted_by_user(user_to_find.id, current_user)
        returned_user.should == nil
      end

    end

  end

  describe "ability to create a practice member" do
    it "can not create a practice member if in sysadmin role" do
      user = Factory.create(:sysadmin_user)
      user.can_create_a_practice_member?.should == false
    end

    it "can create a practice member if in practice admin role" do
      user = Factory.create(:practice_admin_user)
      user.can_create_a_practice_member?.should == true
    end

    it "can create a practice member if is in the practice user role" do
      user = Factory.create(:practice_user)
      user.can_create_a_practice_member?.should == true
    end
  end

  it "should make email lowercase" do
    user = Factory(:practice_admin_user, :email => 'Dk.Kahn@gmail.com')
    user.email.should eq('dk.kahn@gmail.com')
  end

  it "should accept the legacy authlogic authentication information" do
    # test a legacy user
    #ruby-1.9.2-p290 :006 > usr.crypted_password
    # => "20705a461cc2f3af634e886c445c220ea4691a2a37f601d9aab9796ad298c2a699d2a1d38c3b45acd6c6854ef2092a314f6fc654c08ceeff684952436f5c6ac6"
    #ruby-1.9.2-p290 :007 > usr.password_salt
    # => "vvfWf7PV6i2hQmevkPUC"
    clear_text_password = 'Password1'
    user = User.new
    user.email = 'system@wavelineup.com'
    user.crypted_password = '20705a461cc2f3af634e886c445c220ea4691a2a37f601d9aab9796ad298c2a699d2a1d38c3b45acd6c6854ef2092a314f6fc654c08ceeff684952436f5c6ac6'
    user.password_salt = 'vvfWf7PV6i2hQmevkPUC'
    user.role = Role.find_by_name('sysadmin')
    user.active = true
    user.save!

    user.authenticate(user.email, clear_text_password).should == true
    user.authenticate(user.email, 'BadPassword1').should == false

    # test another legacy user to be sure
    #ruby-1.9.2-p290 :016 > user.crypted_password
    # => "343a995b40bfb8a52a49c91816ee91fd3cf48918c8e06991051282be247dc74ba0d5619fe03b6b5d08c195334400113cc601f9b6bf3aceec9907e877d0d8a39f"
    #ruby-1.9.2-p290 :017 > user.password_salt
    # => "-aVdvAFgez8fjPZbf5h6"
    clear_text_password = 'Password1'
    user = User.new
    user.email = 'dk.kahn@gmail.com'
    user.crypted_password = '343a995b40bfb8a52a49c91816ee91fd3cf48918c8e06991051282be247dc74ba0d5619fe03b6b5d08c195334400113cc601f9b6bf3aceec9907e877d0d8a39f'
    user.password_salt = '-aVdvAFgez8fjPZbf5h6'
    user.role = Role.find_by_name('sysadmin')
    user.active = true
    user.save!

    user.authenticate(user.email, clear_text_password).should == true
    user.authenticate(user.email, 'BadPassword1').should == false
  end

  it "should create authenticable crypted password and salt for a new user" do
    clear_text_password = 'Password1'
    user = Factory(:practice_admin_user)
    user.reload
    user.crypted_password.should_not eq(nil)
    user.password_salt.should_not eq(nil)
    user.authenticate(user.email, clear_text_password).should == true
  end

  it "should create/reset perishable token" do
    user = Factory(:practice_admin_user)
    user.perishable_token.empty?.should  eq(true)
    perishable_token = user.reset_perishable_token!
    user.perishable_token.should_not eq(nil)
    user.reset_perishable_token!.should_not eq(perishable_token)
  end

  it "should deliver password reset instructions" do
    ActionMailer::Base.deliveries.clear
    ActionMailer::Base.deliveries.size.should eq(0)
    user = Factory(:practice_admin_user)
    user.deliver_password_reset_instructions!
    ActionMailer::Base.deliveries.size.should eq(1)
  end
end
