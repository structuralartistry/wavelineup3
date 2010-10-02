class PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]  

  def new
    @user = User.new
    render
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    
    respond_to do |format|  
      if @user
        @user.deliver_password_reset_instructions!         
        flash[:notice] = "Instructions to reset your password have been emailed to you. Please check your email."  
        format.html { redirect_to login_path }
      else 
        @user = User.new 
        flash[:notice] = "No user was found with that email address"  
        format.html { render :action => :new  }
      end  
    end
  end
    
  def edit  
    render  
  end  
    
  def update  
    @user.password = params[:user][:password]  
    @user.password_confirmation = params[:user][:password_confirmation]  
    if @user.save 
      flash[:notice] = "Password successfully updated"  
      redirect_to home_url
    else  
      render :action => :edit  
    end  
  end  
    
  private  
  def load_user_using_perishable_token  
    @user = User.find_using_perishable_token(params[:id])  
    unless @user  
      flash[:notice] = <<-EOF 
        We're sorry, but we could not locate your account.
        If you are having issues try copying and pasting the URL
        from your email into your browser or restarting the 
        reset password process.
      EOF
      redirect_to login_url  
    end  
  end

end
