class SessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]

  def new
  end

  def create
    logger.debug "this is the session hash:  #{session} __________________________________________-"

    user = User.find_by(email: params[:session][:email])
    if user
      session[:user_id] = user.id
      redirect_to courses_path
    else
      render "new"
    end  
  end

  def destroy
    logger.debug "Logging out_____________________________________________________________________________________________--"
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_url
  end

end