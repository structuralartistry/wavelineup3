class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  before_filter :authorize
    
  private
  
    def authorize  
      case controller_name
      when 'activations'
        if current_user_session
          flash[:notice] = "You are already logged in to the system. If you are activating a new user please log out first and try again."
          redirect_to root_url
        end
                
      when 'password_resets'
        if current_user_session
          flash[:notice] = "Can't reset your password: you are already logged in to the system"
          redirect_to root_url
        end
        
      when 'practices'
        if action_name == 'index' && current_user.role.name != 'sysadmin'
          flash[:notice] = "Page not permitted per your user role"
          redirect_to root_url
        end
        
      # when 'users'
      #   case action_name
      #   when 'index'
      #     if current_user.role != 'sysadmin'
      #       flash[:notice] = "This action is not permitted"
      #     end
      #   end
        
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
