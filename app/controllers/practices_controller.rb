class PracticesController < ApplicationController
  def index
    @practices = Practice.get_all_restricted_by_user(current_user)
  end

  def new
    @practice = Practice.new

    if params[:token]
      invitation = Invitation.find_by_token(params[:token])
      if invitation
        @practice.referring_practice_id = invitation.referring_user.practice.id
        @referring_practice_name = invitation.referring_user.practice.name
      end
    end

    1.times { @practice.users.build }

    render 'new', :layout => 'guest'
  end

  def edit
    @practice = Practice.get_by_id_restricted_by_user(params[:id], current_user)
    if @practice
      @users = User.find_all_by_practice_id(@practice.id)

      # should never get to this action if current_user is nil
      if current_user.role.name == 'sysadmin'
        render # allow all practices
      else
        if current_user.practice_id == @practice.id
          render
        else
          flash[:notice] = RESTRICTED_PAGE_NOTICE
          redirect_to home_path
        end
      end
    else
      flash[:notice] = RESTRICTED_PAGE_NOTICE
      redirect_to home_path
    end
  end

  def create
    @practice = Practice.new(params[:practice])

    @practice.users[0].role_id = Role.find_by_name('practice admin').id

    if verify_recaptcha(:model => @practice, :message => 'The words you entered do no match the text shown') && @practice.save
      @practice.users[0].deliver_activation_instructions!
      redirect_to(login_path, :notice => 'Practice was successfully created. Please check your email for the activation link.')
    else
      render :action => "new", :layout => 'guest'
    end
  end

  def update
    @practice = Practice.get_by_id_restricted_by_user(params[:id], current_user)

    if @practice
      if current_user.role.name == 'sysadmin' || current_user.practice.id == @practice.id
        if @practice && @practice.update_attributes(params[:practice])
          redirect_to(home_path, :notice => 'Practice was successfully updated')
        else
          render :action => "edit"
        end
      else
        flash[:notice] = RESTRICTED_PAGE_NOTICE
        redirect_to home_path
      end
    else
      flash[:notice] = RESTRICTED_PAGE_NOTICE
      redirect_to home_path
    end
  end

  def confirm_delete
  end

  def destroy
    @practice = current_user.practice
    @practice.destroy
    flash[:notice] = "Practice successfully deleted"
    session[:current_user_id] = nil

    redirect_to(login_path)
  end

  def export
    exported_data = StringIO.new
    exported_data.write("<practice name='#{current_user.practice.name}'>")
    current_user.practice.practice_members.each do |practice_member|
      exported_data.write(practice_member.to_xml(:skip_instruct => true, :include => [:travel_card, :visits]))
    end
    exported_data.write('</practice>')
    send_data exported_data.string, :type => "text/plain",
                                    :filename=>"#{current_user.practice.name.gsub(/ /,'_')}.xml",
                                    :disposition => 'attachment'
  end
end
