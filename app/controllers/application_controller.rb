class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  before_filter :authorize
    
  private
  
    def authorize
      
      if current_user
      
        case controller_name
        when 'activations'
          if current_user
            flash[:notice] = "You are already logged in to the system. If you are activating a new user please log out first and try again."
            redirect_to home_path
          end   
        when 'password_resets'
          if current_user
            flash[:notice] = "Can't reset your password: you are already logged in to the system"
            redirect_to home_path
          end
        when 'practices'
          case action_name
          when 'index'
            if current_user.role.name != 'sysadmin'
              flash[:notice] = RESTRICTED_PAGE_NOTICE
              redirect_to home_path
            end 
          when 'destroy'
            if current_user.role.name != 'sysadmin'
              flash[:notice] = RESTRICTED_PAGE_NOTICE
              redirect_to home_path
            end
          end
        
        when 'users'
          
          # when 'users'
          #   case action_name
          #   when 'index'
          #     if current_user.role != 'sysadmin'
          #       flash[:notice] = "This action is not permitted"
          #     end
          #   end
          
        end
          
      else
      
        # no current_user
      
        case controller_name
        when 'activations'
        when 'password_resets'
        when 'practices'
          if action_name != 'new' && action_name != 'create'
            flash[:notice] = RESTRICTED_PAGE_NOTICE
            redirect_to login_path 
          end
        when 'user_sessions'
        else redirect_to login_path
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
