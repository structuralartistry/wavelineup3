class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  helper_method :lineup_practice_member_ids
  
  before_filter :redirect_to_https, :prohibit_internet_explorer, :authorize
  
  rescue_from Exception, :with => :rescue_all_exceptions if Rails.env == 'production'
  def rescue_all_exceptions(exception)
    case exception
      when ActiveRecord::RecordNotFound
        render :text => "<h1>The requested record was not found</h1>", :layout => "application", :status => :not_found
      when ActionController::RoutingError, ActionController::UnknownController, ActionController::UnknownAction
        render :text => "<h1>The request made was invalid</h1>", :layout => "application", :status => :not_found
      else
        begin
          SystemError.new(:user_id => nil,
                          :error => "Undefined exception", 
                          :incidentals => { "controller_name" => controller_name || "",
                                            "action_name" => action_name || "",
                                            "request.request_uri" => request.request_uri || "",
                                            "request.method" => request.method || "",
                                            "request.path" => request.path || "",
                                            "request.parameters.inspect" => request.parameters.inspect || "",
                                            "exception.message" => exception.message || "",
                                            "exception.clean_backtrace" => exception.clean_backtrace || "" }
                          ).save
        rescue
          # worst case we save it to the error logger
          logger.error( "\nWhile processing a #{request.method} request on #{request.path}\n
          parameters: #{request.parameters.inspect}\n
          #{exception.message}\n#{exception.backtrace.join( "\n" )}\n\n" )  
        end
        render :text => "<h1>An internal error occurred. Sorry for the inconvenience</h1>", :layout => "application", :status => :internal_server_error
    end
  end
      
  private
  
    def redirect_to_https
      if Rails.env=='production'
        redirect_to 'https://' + request.host_with_port + request.fullpath if request.env['HTTP_X_FORWARDED_PROTO'] != 'https'
      end
    end
    
    def set_timezone
      Time.zone = current_user.practice.time_zone
    end
 
    def authorize
      if current_user 
        return_value = current_user.authorize(controller_name, action_name)
        set_timezone
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
    
    def prohibit_internet_explorer
      request.fullpath =~ /internet_explorer/
      if !$&
        redirect_to '/internet_explorer' if request.user_agent =~ /MSIE/
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
    
    def lineup_practice_member_ids
      session[:lineup_practice_member_ids] = Lineup.new(LINEUP_DURATION_OF_STAY_MINUTES) if !session[:lineup_practice_member_ids]
      session[:lineup_practice_member_ids]
    end
    
end
