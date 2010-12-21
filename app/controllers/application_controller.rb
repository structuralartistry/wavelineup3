class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  before_filter :redirect_to_https, :authorize
      
  private
  
    def redirect_to_https
      if Rails.env=='production'
        redirect_to 'https://' + request.host_with_port + request.fullpath if request.env['HTTP_X_FORWARDED_PROTO'] != 'https'
      end
    end
 
    def authorize
      if current_user 
        return_value = current_user.authorize(controller_name, action_name)
      else
        return_value = User.new.authorize(controller_name, action_name)
      end

      if !return_value[:success]
        flash[:notice] = return_value[:failure_message]
        if current_user
          redirect_to home_path
        else
          redirect_to login_path
        end
      end
    end
          
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
end
