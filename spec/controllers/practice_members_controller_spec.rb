#require 'spec_helper'
#
#describe PracticeMembersController do
#
#  describe "GET edit" do
#    it "does not load for guest role" do 
#      practice_member = Factory.create(:practice_member)
#      
#      get :edit, :id => practice_member.id
#      flash[:notice].should match RESTRICTED_PAGE_NOTICE
#      response.should redirect_to(login_path)
#    end
#    
#    it "loads for practice admin role" do
#      current_user = login_user(:practice_admin_user)
#      practice_member = Factory.create(:practice_member, :practice_id => current_user.practice_id)
#      
#      get :edit, :id => practice_member.id
#      response.should be_success
#    end
#    
#    it "loads for practice user role" do
#      current_user = login_user(:practice_user)
#      practice_member = Factory.create(:practice_member, :practice_id => current_user.practice_id)
#      
#      get :edit, :id => practice_member.id
#      response.should be_success 
#    end    
#  end
#  
#  describe "POST create" do
#    it "does not create for guest role" do
#      post :create, :practice_member => { :name_last => "Hack", :name_first => "Paul", :name_middle => "A" }
#      flash[:notice].should match RESTRICTED_PAGE_NOTICE
#      response.should redirect_to(login_path)
#    end
#
#    it "creates for practice admin role" do
#      current_user = login_user(:practice_admin_user)
#      
#      post :create, :practice_member => { :name_last => "Kahn", :name_first => "David", :name_middle => "N" }
#      flash[:notice].should match "Practice Member successfully created"
#      response.should redirect_to(edit_practice_path(current_user.practice_id))
#    end
#    
#    it "creates for practice user role" do
#      current_user = login_user(:practice_user)
#      
#      post :create, :practice_member => { :name_last => "Kahn", :name_first => "David", :name_middle => "N" }
#      flash[:notice].should match "Practice Member successfully created"
#      response.should redirect_to(edit_practice_path(current_user.practice_id))
#    end
#  end
#  
#  describe "PUT update" do
#    it "does not update for guest role" do
#      practice_member = Factory.create(:practice_member)
#      
#      post :update, :id => practice_member.id, :practice_member => { :name_last => practice_member.name_last, :name_first => practice_member.name_first, :name_middle => practice_member.name_middle }
#      flash[:notice].should match RESTRICTED_PAGE_NOTICE
#      response.should redirect_to(login_path)
#    end
#
#    it "updates for practice admin role" do
#      current_user = login_user(:practice_admin_user)
#      
#      practice_member = Factory.create(:practice_member)
#      post :update, :id => practice_member.id, :practice_member => { :name_last => practice_member.name_last, :name_first => practice_member.name_first, :name_middle => practice_member.name_middle }
#      flash[:notice].should match "Practice Member successfully updated"
#      response.should redirect_to(edit_practice_path(current_user.practice_id))
#    end
#    
#    it "updates for practice user role" do
#      current_user = login_user(:practice_user)
#      practice_member = Factory.create(:practice_member)
#      
#      post :update, :id => practice_member.id, :practice_member => { :name_last => practice_member.name_last, :name_first => practice_member.name_first, :name_middle => practice_member.name_middle }
#      flash[:notice].should match "Practice Member successfully updated"
#      response.should redirect_to(edit_practice_path(current_user.practice_id))
#    end
#  end
#  
#  describe "DELETE destroy" do
#    it "does not delete for guest role" do
#      practice_member = Factory.create(:practice_member)
#      delete :destroy, :id => practice_member.id
#      flash[:notice].should match RESTRICTED_PAGE_NOTICE
#      response.should redirect_to(login_path)
#    end
#    
#    it "deletes for practice admin role" do
#      current_user = login_user(:practice_admin_user)
#      
#      practice_member = Factory.create(:practice_member)
#      delete :destroy, :id => practice_member.id
#      flash[:notice].should match "Practice Member successfully deleted"
#      response.should redirect_to(edit_practice_path(current_user.practice_id))
#    end
#
#    it "deletes for practice user role" do
#      current_user = login_user(:practice_admin_user)
#      
#      practice_member = Factory.create(:practice_member)
#      delete :destroy, :id => practice_member.id
#      flash[:notice].should match "Practice Member successfully deleted"
#      response.should redirect_to(edit_practice_path(current_user.practice_id))
#    end
#  end
#
#end
#
#
#
## def mock_practice_member(stubs={})
##   @mock_practice_member ||= mock_model(PracticeMember, stubs).as_null_object
## end
## 
## describe "GET index" do
##   it "assigns all practice_members as @practice_members" do
##     PracticeMember.stub(:all) { [mock_practice_member] }
##     get :index
##     assigns(:practice_members).should eq([mock_practice_member])
##   end
## end
## 
## describe "GET show" do
##   it "assigns the requested practice_member as @practice_member" do
##     PracticeMember.stub(:find).with("37") { mock_practice_member }
##     get :show, :id => "37"
##     assigns(:practice_member).should be(mock_practice_member)
##   end
## end
## 
## describe "GET new" do
##   it "assigns a new practice_member as @practice_member" do
##     PracticeMember.stub(:new) { mock_practice_member }
##     get :new
##     assigns(:practice_member).should be(mock_practice_member)
##   end
## end
## 
## describe "GET edit" do
##   it "assigns the requested practice_member as @practice_member" do
##     PracticeMember.stub(:find).with("37") { mock_practice_member }
##     get :edit, :id => "37"
##     assigns(:practice_member).should be(mock_practice_member)
##   end
## end
## 
## describe "POST create" do
## 
##   describe "with valid params" do
##     it "assigns a newly created practice_member as @practice_member" do
##       PracticeMember.stub(:new).with({'these' => 'params'}) { mock_practice_member(:save => true) }
##       post :create, :practice_member => {'these' => 'params'}
##       assigns(:practice_member).should be(mock_practice_member)
##     end
## 
##     it "redirects to the created practice_member" do
##       PracticeMember.stub(:new) { mock_practice_member(:save => true) }
##       post :create, :practice_member => {}
##       response.should redirect_to(practice_member_url(mock_practice_member))
##     end
##   end
## 
##   describe "with invalid params" do
##     it "assigns a newly created but unsaved practice_member as @practice_member" do
##       PracticeMember.stub(:new).with({'these' => 'params'}) { mock_practice_member(:save => false) }
##       post :create, :practice_member => {'these' => 'params'}
##       assigns(:practice_member).should be(mock_practice_member)
##     end
## 
##     it "re-renders the 'new' template" do
##       PracticeMember.stub(:new) { mock_practice_member(:save => false) }
##       post :create, :practice_member => {}
##       response.should render_template("new")
##     end
##   end
## 
## end
## 
## describe "PUT update" do
## 
##   describe "with valid params" do
##     it "updates the requested practice_member" do
##       PracticeMember.should_receive(:find).with("37") { mock_practice_member }
##       mock_practice_member.should_receive(:update_attributes).with({'these' => 'params'})
##       put :update, :id => "37", :practice_member => {'these' => 'params'}
##     end
## 
##     it "assigns the requested practice_member as @practice_member" do
##       PracticeMember.stub(:find) { mock_practice_member(:update_attributes => true) }
##       put :update, :id => "1"
##       assigns(:practice_member).should be(mock_practice_member)
##     end
## 
##     it "redirects to the practice_member" do
##       PracticeMember.stub(:find) { mock_practice_member(:update_attributes => true) }
##       put :update, :id => "1"
##       response.should redirect_to(practice_member_url(mock_practice_member))
##     end
##   end
## 
##   describe "with invalid params" do
##     it "assigns the practice_member as @practice_member" do
##       PracticeMember.stub(:find) { mock_practice_member(:update_attributes => false) }
##       put :update, :id => "1"
##       assigns(:practice_member).should be(mock_practice_member)
##     end
## 
##     it "re-renders the 'edit' template" do
##       PracticeMember.stub(:find) { mock_practice_member(:update_attributes => false) }
##       put :update, :id => "1"
##       response.should render_template("edit")
##     end
##   end
## 
## end
## 
## describe "DELETE destroy" do
##   it "destroys the requested practice_member" do
##     PracticeMember.should_receive(:find).with("37") { mock_practice_member }
##     mock_practice_member.should_receive(:destroy)
##     delete :destroy, :id => "37"
##   end
## 
##   it "redirects to the practice_members list" do
##     PracticeMember.stub(:find) { mock_practice_member }
##     delete :destroy, :id => "1"
##     response.should redirect_to(practice_members_url)
##   end
## end
