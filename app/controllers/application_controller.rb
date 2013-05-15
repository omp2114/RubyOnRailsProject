class ApplicationController < ActionController::Base
  before_filter :require_user
  protect_from_forgery

  protected
  def authorize
    unless admin?
      flash[:error] = "unauthorize access"
      redirect_to courses_path
      false
    end
  end
  def admin?
    @current_user.role == 'student'
  end
  helper_method :admin?

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def require_user
    if current_user
      return true
    end
    redirect_to root_url
  end



end