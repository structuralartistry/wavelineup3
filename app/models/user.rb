class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :practice
  belongs_to :role
  has_many :invitations, :foreign_key => 'referring_user_id'
  has_many :feedback_supports
  has_many :system_errors
  has_many :logins

  validates_presence_of :role

  validates_format_of :password, :with => /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/, :if => :password_present?, :message => 'must be at least 8 characters and contain at least one uppercase letter and one number'

  attr_accessible :email, :password, :password_confirmation, :perishable_token, :persistence_token

  # password not always present if updating a user, etc...anything beyond new user creation
  def password_present?
    return self.password
  end

  def self.get_all_restricted_by_user(requesting_user)
    return nil if !requesting_user
    if requesting_user.role.name == 'sysadmin'
      return User.all
    else
      return User.find_all_by_practice_id(requesting_user.practice_id)
    end
  end

  def self.get_by_id_restricted_by_user(user_id, requesting_user)
    return nil if !requesting_user
    if requesting_user.role.name == 'sysadmin'
      return User.find(user_id)
    else
      return User.where("id=#{user_id} and practice_id=#{requesting_user.practice_id}").first
    end
  end

  def deliver_activation_instructions!
    begin
      reset_perishable_token!
      SystemMailer.user_activation_instructions(self).deliver
    rescue

    end
  end

  def activate!
    self.active = true
    save
  end

  def deliver_welcome!
    begin
      reset_perishable_token!
      SystemMailer.user_welcome_email(self).deliver
    rescue

    end
  end

  def deliver_password_reset_instructions!
    begin
      reset_perishable_token!
      SystemMailer.password_reset_instructions(self).deliver
    rescue

    end
  end

  def can_create_a_practice_member?
    if self.role.name == 'practice admin' || self.role.name == 'practice user' then
      return true
    end
    false
  end


  def authorize(controller_name, action_name)
    if self.role
      current_role = self.role.name
    else
      # guest user is empty user
      current_role = 'guest'
    end


    case controller_name
    when 'activations'
      if current_role != 'guest'
        return set_autorize_failure_value("You are already logged in to the system. If you are activating a new user please log out first and try again.")
      end
      return authorize_success_message

    when 'feature_requests'
      return set_autorize_failure_value(LOGIN_NOTICE) if current_role == 'guest'
      if current_role == 'sysadmin'
        return authorize_success_message
      elsif action_name == 'index'
        return authorize_success_message
      end
      return set_autorize_failure_value(LOGIN_NOTICE)

    when 'feedback_supports'
      if current_role == 'guest' || current_role == 'sysadmin'
        return set_autorize_failure_value(LOGIN_NOTICE)
      end
      return authorize_success_message

    when 'home'
      if current_role == 'guest'
        if action_name != 'terms_of_service' && action_name != 'privacy_policy' && action_name != 'about'
          return set_autorize_failure_value(LOGIN_NOTICE)
        end
      end
      return authorize_success_message

    when 'invitations'
      if current_role == 'guest' || current_role == 'sysadmin'
        return set_autorize_failure_value(LOGIN_NOTICE)
      end
      return authorize_success_message

    when 'password_resets'
      if current_role != 'guest'
        return set_autorize_failure_value("Can't reset your password: you are already logged in to the system")
      end
      return authorize_success_message

    when 'practice_members'
      if current_role == 'guest'
        return set_autorize_failure_value(LOGIN_NOTICE)
      end
      return authorize_success_message

    when 'practice_room'
      if current_role == 'guest' || current_role == 'sysadmin'
        return set_autorize_failure_value(LOGIN_NOTICE)
      end
      return authorize_success_message

    when 'practices'
      case current_role
      when 'guest'
        if action_name != 'new' && action_name != 'create'
          return set_autorize_failure_value(LOGIN_NOTICE)
        end
        return authorize_success_message
      else
        case action_name
        when 'index'
          if current_role != 'sysadmin'
            return set_autorize_failure_value(RESTRICTED_PAGE_NOTICE)
          end
        when 'new'
          return set_autorize_failure_value("If you wish to create a new Practice, you must be logged out of the system")
        when 'create'
          return set_autorize_failure_value("If you wish to create a new Practice, you must be logged out of the system")
        when 'confirm_delete'
          if current_role != 'practice admin'
            return set_autorize_failure_value(RESTRICTED_PAGE_NOTICE)
          end
        when 'destroy'
          if current_role != 'practice admin'
            return set_autorize_failure_value(RESTRICTED_PAGE_NOTICE)
          end
        end
        return authorize_success_message
      end

    when 'travel_cards'
      case current_role
      when 'guest'
        if action_name != 'new' && action_name != 'create'
          return set_autorize_failure_value(LOGIN_NOTICE)
        end
      end
      return authorize_success_message

    when 'user_sessions'
      case current_role
      when 'guest'
        if action_name == 'destroy'
          return set_autorize_failure_value("You are not logged in to the system")
        end
      else
        if action_name != 'destroy'
          return set_autorize_failure_value("You are already logged in to the system")
        end
      end
      return authorize_success_message

    when 'users'
      if current_role == 'guest'
        return set_autorize_failure_value(LOGIN_NOTICE)
      end
      return authorize_success_message

    when 'visits'
      case current_role
      when 'guest'
        return set_autorize_failure_value(LOGIN_NOTICE)
      when 'sysadmin'
        return set_autorize_failure_value(LOGIN_NOTICE)
      end

      return authorize_success_message

    else return set_autorize_failure_value(RESTRICTED_PAGE_NOTICE)
    end
  end


  private

  def authorize_success_message
    return { :success => true, :failure_message => nil }
  end

  def set_autorize_failure_value(failure_message)
    return { :success => false, :failure_message => failure_message}
  end




end
